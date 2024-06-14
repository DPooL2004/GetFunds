import 'package:flutter/material.dart';
import 'package:getfunds/colores.dart';
import 'package:getfunds/componentes/modal_Ahorro.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:getfunds/vistas/ajustes.dart';
import 'package:getfunds/vistas/estadisticas.dart';
import 'package:getfunds/vistas/home.dart';

class Ahorro extends StatefulWidget {
  @override
  State<Ahorro> createState() => _AhorroState();
}

class _AhorroState extends State<Ahorro> {
  Modal_Ahorro modal = Modal_Ahorro();
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
    return FirebaseFirestore.instance.collection('Ahorro').where('Correo', isEqualTo: _correoUsuario).get();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                /*Inicio Barra con nombre de Sección y Botón de Agregar*/
                Padding(
                  padding: EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Text("Ahorro",
                          style: TextStyle(
                            fontFamily: 'Jost',
                            fontWeight: FontWeight.bold,
                            fontSize: 25
                          ),
                        ),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: colorPrincipal,
                          shape: CircleBorder()
                        ),
                        onPressed: (){
                          modal.mainBottomSheet(context);
                        },
                        child: Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 40,
                        ),
                      )
                    ],
                  ),
                ),

                /*Imagen de Cerdito*/
                Padding(
                  padding: EdgeInsets.only(top: 0, bottom: 10, left: 20, right: 20),
                  child: Transform.rotate(
                    angle: 226,
                    child: Container(
                      height: 300,
                      width: 300,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('img/ahorro.png')
                        )
                      ),
                    ),
                  ),
                ),

                /*Contenedores de Ahorro*/
                FutureBuilder(
                  future: _futureData,
                  builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return Center(child: Text('Error: ${snapshot.error}'));
                    } else
                    if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                      return Center(child: Text('No data found'));
                    } else {
                      return Container(
                        child: Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 20),
                            child: ListView.builder(
                            itemCount: snapshot.data!.docs.length,
                            itemBuilder: (context, index) {
                              Map<String, dynamic> data = snapshot.data!
                                  .docs[index].data() as Map<String, dynamic>;
                                return Container(
                                  margin: EdgeInsets.only(top: 10),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(20),
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.black12,
                                            spreadRadius: 1,
                                            blurRadius: 3,
                                            offset: Offset(0, 2)
                                        )
                                      ]
                                  ),
                                  child: ListTile(
                                    trailing: Icon(
                                        Icons.keyboard_arrow_down_rounded),
                                    title: Text('${data['Nombre']}'),
                                    subtitle: Text('${data['Monto_Mensual']}'),
                                    leading: Container(
                                      height: 20,
                                      width: 20,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  'img/cartera.png')
                                          )
                                      ),
                                    ),
                                  ),
                                );
                              }
                            ),
                          ),
                        ),
                      );
                    }
                  }
                ),
                /*Barra de Navegación*/
                Container(
                  padding: EdgeInsets.only(top: 0, bottom: 10, left: 20, right: 20),
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: colorPrincipal,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        FilledButton(
                            style: FilledButton.styleFrom(
                                backgroundColor: Colors.transparent
                            ),
                            onPressed: (){
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context)=>home())
                              );
                            },
                            child: Container(
                              height: 25,
                              width: 25,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage('img/hogarGetFunds.png',)
                                  )
                              ),
                            )
                        ),
                        FilledButton(
                            style: FilledButton.styleFrom(
                                backgroundColor: Colors.transparent
                            ),
                            onPressed: (){
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context)=>Ahorro())
                              );
                            },
                            child: Container(
                              height: 25,
                              width: 25,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage('img/carteraGetFunds.png')
                                  )
                              ),
                            )
                        ),
                        FilledButton(
                            style: FilledButton.styleFrom(
                                backgroundColor: Colors.transparent
                            ),
                            onPressed: (){
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context)=>Estadisticas())
                              );
                            },
                            child: Container(
                              height: 25,
                              width: 25,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage('img/estadisticasGetFunds.png')
                                  )
                              ),
                            )
                        ),
                        FilledButton(
                            style: FilledButton.styleFrom(
                                backgroundColor: Colors.transparent
                            ),
                            onPressed: (){
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context)=>Ajustes())
                              );
                            },
                            child: Container(
                              height: 25,
                              width: 25,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage('img/ajustesGetFunds.png')
                                  )
                              ),
                            )
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
        ),
      ),
    );
  }
}

