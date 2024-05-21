import 'package:flutter/material.dart';
import 'package:getfunds/colores.dart';
import 'package:getfunds/conexion.dart';
import 'package:getfunds/registros.dart';

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
                        fontSize: 18
                      ),),
                    ),
                  ),
                  Container(
                    child: Text('150.000',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18
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
                                fontSize: 16
                            ),),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 15,left: 75),
                          child: Text('60.000',
                            style: TextStyle(
                                color: colorPrincipal,
                                fontWeight: FontWeight.bold,
                                fontSize: 18
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
                                fontSize: 16
                            ),),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 15,left: 82),
                          child: Text('60.000',
                            style: TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.bold,
                                fontSize: 18
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
                                fontSize: 18
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
                        fontSize: 20
                    ),
                  ),
                ),
              ],
            ),
            /*Se trae desde BD los registros en registros.dart*/
            Container(
              height: 452,
              child: MyHomePage(),
            ),
            Container(
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Color.fromRGBO(2,114,33,1),
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
                        onPressed: (){},
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
