import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:getfunds/colores.dart';
import 'package:intl/intl.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegistrosHome extends StatefulWidget {
  @override
  _RegistrosHomeState createState() => _RegistrosHomeState();
}

class _RegistrosHomeState extends State<RegistrosHome> {
  late Future<QuerySnapshot> _futureData;
  String _correoUsuario = '';

  @override
  void initState() {
    super.initState();
    _getUserEmail();
    _futureData = getData();
  }

  Future<void> _getUserEmail() async {
    User? user = FirebaseAuth.instance.currentUser;
    setState(() {
      if (user != null) {
        _correoUsuario = user.email ?? 'No email available';
        _futureData = getData();
      } else {
        _correoUsuario = 'No user signed in';
      }
    });
  }

  Future<QuerySnapshot> getData() async {
    return FirebaseFirestore.instance
        .collection('Registros')
        .where('Correo', isEqualTo: _correoUsuario)
        .get();
  }

  Future<void> _deleteRecord(String documentId) async {
    await FirebaseFirestore.instance.collection('Registros').doc(documentId).delete();
    setState(() {
      _futureData = getData();
    });
  }

  Future<void> _editRecord(String documentId) async {
    // Obtén los datos del registro
    DocumentSnapshot doc = await FirebaseFirestore.instance.collection('Registros').doc(documentId).get();
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

    TextEditingController valorController = TextEditingController(text: data['Valor'].toString());
    String tipo = data['Tipo'];

    await showDialog(
      context: context,
      builder: (context) {
        return Theme(
          data: Theme.of(context).copyWith(
            dialogBackgroundColor: Color.fromRGBO(222, 226, 230,1), // Fondo del diálogo
            textTheme: TextTheme(
              bodyMedium: TextStyle(color: Colors.black), // Color del texto
            ),
            buttonTheme: ButtonThemeData(
              textTheme: ButtonTextTheme.primary, // Color de los botones
            ),
          ),
          child: AlertDialog(
            title: Text('Editar Registro', style: TextStyle(color: colorSecundario)),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: valorController,
                  decoration: InputDecoration(
                    labelText: 'Valor',
                    labelStyle: TextStyle(color: Colors.black),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                  ),
                  style: TextStyle(color: Colors.black),
                ),
                DropdownButton<String>(
                  value: tipo,
                  onChanged: (String? newValue) {
                    setState(() {
                      tipo = newValue!;
                    });
                  },
                  items: <String>['Ingreso', 'Egreso']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value,
                      style: TextStyle(
                        color: Colors.black
                      ),)
                    );
                  }).toList(),
                ),
              ],
            ),
            actions: [
              TextButton(
                child: Text('Cancelar', style: TextStyle(color: Colors.black)),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                child: Text('Guardar', style: TextStyle(color: Colors.black)),
                onPressed: () async {
                  await FirebaseFirestore.instance.collection('Registros').doc(documentId).update({
                    'Valor': int.parse(valorController.text),
                    'Tipo': tipo,
                  });
                  setState(() {
                    _futureData = getData();
                  });
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder<QuerySnapshot>(
        future: _futureData,
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return Center(child: Text('No data found'));
          } else {
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      Map<String, dynamic> data = snapshot.data!.docs[index].data() as Map<String, dynamic>;
                      DateTime fecha = (data['Fecha'] as Timestamp).toDate();
                      String formattedDate = DateFormat('yyyy-MM-dd').format(fecha);
                      String documentId = snapshot.data!.docs[index].id;

                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black12,
                                spreadRadius: 1,
                                blurRadius: 3,
                                offset: Offset(0, 2),
                              ),
                            ],
                          ),
                          child: ExpansionTile(
                            backgroundColor: Colors.transparent,
                            title: Text(formattedDate),
                            leading: Icon(
                              Icons.calendar_month,
                              color: colorPrincipal,
                            ),
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  width: MediaQuery.of(context).size.width * 1,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(left: 10),
                                        child: Text(
                                          'Valor: ${data['Valor']}',
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 10),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 10, bottom: 5),
                                        child: Text(
                                          'Tipo: ${data['Tipo']}',
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 10),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          TextButton.icon(
                                            icon: Icon(Icons.edit, color: Colors.green),
                                            label: Text('Editar',
                                            style: TextStyle(
                                              color: Colors.black
                                            ),
                                            ),
                                            onPressed: () {
                                              _editRecord(documentId);
                                            },
                                          ),
                                          SizedBox(width: 10),
                                          TextButton.icon(
                                            icon: Icon(Icons.delete, color: Colors.red),
                                            label: Text('Eliminar',
                                            style: TextStyle(
                                              color: Colors.black
                                            ),
                                            ),
                                            onPressed: () {
                                              _deleteRecord(documentId);
                                            },
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
