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
        setState(() {
          _correoUsuario = user.email ?? 'No email available';
          getData();
        });
      } else {
        _correoUsuario = 'No user signed in';
      }
    });
  }

  Future<QuerySnapshot> getData() async {
    return FirebaseFirestore.instance.collection('Registros').where('Correo', isEqualTo: _correoUsuario).get();
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
                                    offset: Offset(0,2)
                                )
                              ]
                          ),
                          child: GestureDetector(
                            /*onTap: () {
                              // Acciones a realizar cuando se toca el elemento
                            },*/
                            child: ExpansionTile(
                              backgroundColor: Colors.transparent,

                              title: Text(formattedDate),
                              leading: Icon(Icons.calendar_month,
                              color: colorPrincipal,),
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    width:MediaQuery.of(context).size.width*1,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),

                                    ),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(left: 10,),
                                          child: Text('Valor: ${data['Valor']}',
                                            style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: 10,),

                                        Padding(
                                          padding: const EdgeInsets.only(left: 10, bottom: 5),
                                          child: Text('Tipo: ${data['Tipo']}',
                                            style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
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


