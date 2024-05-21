import 'package:flutter/material.dart';
import 'package:getfunds/colores.dart';
import 'package:getfunds/conexion.dart';
import 'package:getfunds/registros.dart';
import 'package:getfunds/vistas/ahorro.dart';

class home extends StatefulWidget { // Make it StatefulWidget
  const home({super.key});

  @override
  State<home> createState() => _HomeState(); // Create a State class
}

class _HomeState extends State<home> { // State class for Home

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
                    onPressed: (){},
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
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Saldo Total',
                      style: TextStyle(
                        color: Color.fromRGBO(87, 87, 87, 1),
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        fontFamily: 'Jost'
                      ),),
                    ),
                  ),
                  Container(
                    child: Text('150.000',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                        fontFamily: 'Jost'
                    ),),
                  ),
                  Container(
                    child: Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 15,left: 35),
                          width: 20,
                          height: 20,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('img/ingresos.png')
                            )
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 15,left: 10),
                          child: Text('Ingresos',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                fontFamily: 'Jost'
                            ),),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 15,left: 75),
                          child: Text('60.000',
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
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 15,left: 35),
                          width: 20,
                          height: 20,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('img/egresos.png')
                              )
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 15,left: 10),
                          child: Text('Egresos',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                fontFamily: 'Jost'
                            ),),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 15,left: 82),
                          child: Text('60.000',
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
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 15,left: 35),
                          width: 20,
                          height: 20,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('img/balance.png')
                              )
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 15,left: 12),
                          child: Text('Balance',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 16
                            ),),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 15,left: 82),
                          child: Text('60.000',
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
              child: MyHomePage(),
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
                        onPressed: (){},
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
                        onPressed: (){},
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
