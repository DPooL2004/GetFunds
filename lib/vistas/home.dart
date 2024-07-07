import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:getfunds/colores.dart';
import 'package:getfunds/componentes/modal_Home.dart';
import 'package:getfunds/registros.dart';
import 'package:getfunds/vistas/ahorro.dart';
import 'package:getfunds/vistas/ajustes.dart';
import 'package:getfunds/vistas/estadisticas.dart';
import 'package:firebase_auth/firebase_auth.dart';

class home extends StatefulWidget { // Make it StatefulWidget


  @override
  State<home> createState() => _HomeState(); // Create a State class
}

class _HomeState extends State<home> {
  int totalIngresos = 0;
  int totalEgresos = 0;
  int balance = 0;
  late Future<QuerySnapshot> _futureData;
  String _correoUsuario = '';

  @override
  void initState() {
    super.initState();
    sumarIngresos();
    sumarEgresos();
    _getUserEmail();
  }

  Future<void> _getUserEmail() async {
    User? user = FirebaseAuth.instance.currentUser;
    setState(() {
      if (user != null) {
        _correoUsuario = user.email ?? 'No email available';
        _futureData = getData(); // Load data after getting the email
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

  Future<void> _obtenerValor() async {
    await Future.wait([sumarIngresos(), sumarEgresos()]);
    if (mounted) {
      setState(() {});
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _obtenerValor();
  }


  Future<void> sumarIngresos() async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection('Registros').where('Tipo', isEqualTo: 'Ingreso').where('Correo', isEqualTo: _correoUsuario).get();

    int sumaIngresos = 0;

    querySnapshot.docs.forEach((document) {
      if (document.data() != null) {
        dynamic data = document.data();
        if (data['Valor'] != null) {
          int? valorIngreso = data['Valor'] as int?;
          if (valorIngreso != null) {
            sumaIngresos += valorIngreso;
          }
        }
      }
    });

    totalIngresos = sumaIngresos;
  }

  Future<void> sumarEgresos() async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection('Registros').where('Tipo', isEqualTo: 'Egreso').where('Correo', isEqualTo: _correoUsuario).get();

    int sumaEgresos = 0;

    querySnapshot.docs.forEach((document) {
      if (document.data() != null) {
        dynamic data = document.data();
        if (data['Valor'] != null) {
          int? valorIngreso = data['Valor'] as int?;
          if (valorIngreso != null) {
            sumaEgresos += valorIngreso;
          }
        }
      }
    });

    totalEgresos = sumaEgresos;
  }


  Modal_Home modalHome = Modal_Home();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 15, left: 20),
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('img/GetFundsLogoPequeño.png'),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    child: Text('Agregar',
                    style: TextStyle(
                      color: colorPrincipal,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      fontFamily: 'Jost'
                    ),
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: colorPrincipal,
                        shape: CircleBorder()
                    ),
                    onPressed: (){
                      modalHome.mainBottomSheet(context);
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
            SizedBox(height: 10,),
            Container(
              width: 300,
              height: 200,
              decoration: BoxDecoration(
                  color: Color.fromRGBO(241,242,241,1),
                  borderRadius: BorderRadius.circular(10.0)
              ),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Resumen',
                      style: TextStyle(
                        color: Color.fromRGBO(87, 87, 87, 1),
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        fontFamily: 'Jost'
                      ),),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          child: Row(
                            children: [
                              Container(
                                margin: EdgeInsets.only(left: 5),
                                width: 20,
                                height: 20,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage('img/ingresos.png')
                                    )
                                ),
                              ),
                              Container(
                                child: Text('Ingresos',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      fontFamily: 'Jost'
                                  ),),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          child: Text('$totalIngresos',
                            style: TextStyle(
                                color: colorPrincipal,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                fontFamily: 'Jost'
                            ),),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          child: Row(
                            children: [
                              Container(
                                width: 20,
                                height: 20,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage('img/egresos.png')
                                    )
                                ),
                              ),
                              Container(
                                child: Text('Egresos',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      fontFamily: 'Jost'
                                  ),),
                              ),
                            ],
                          ),
                        ),

                        Container(
                          child: Text('$totalEgresos',
                            style: TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                fontFamily: 'Jost'
                            ),),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          child: Row(
                            children: [
                              Container(
                                width: 20,
                                height: 20,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage('img/balance.png')
                                    )
                                ),
                              ),
                              Container(
                                child: Text('Balance',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16
                                  ),),
                              ),
                            ],
                          ),
                        ),

                        Container(

                          child: Text('${totalIngresos - totalEgresos}',
                            style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                fontFamily: 'Jost'
                            ),),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 20, top: 20),
                  child: Text('Registros',
                    style: TextStyle(
                        color: colorPrincipal,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        fontFamily: 'Jost'
                    ),
                  ),
                ),
              ],
            ),
            /*Se trae desde BD los registros en registros.dart*/
            Container(
              height: 300,
              child: RegistrosHome(),
            ),
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
                        onPressed: (){},
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
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Ajustes()));
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
    );
  }
}
