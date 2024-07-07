import 'package:flutter/material.dart';
import 'package:getfunds/colores.dart';
import 'package:getfunds/vistas/ahorro.dart';
import 'package:getfunds/vistas/ajustes.dart';
import 'package:getfunds/vistas/home.dart';

class Estadisticas extends StatefulWidget {
  @override
  State<Estadisticas> createState() => _EstadisticasState();
}

class _EstadisticasState extends State<Estadisticas> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                /*Inicio Barra con nombre de Sección y Botón de Agregar*/
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('img/GetFundsLogoPequeño.png')
                        )
                      ),
                    ),
                  ],
                ),

                /*Bloques Estadisticos*/
                SingleChildScrollView(
                  child: Container(
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.black12,
                                        spreadRadius: 1,
                                        blurRadius: 3,
                                        offset: Offset(0, 2)
                                    )
                                  ]
                              ),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          color: colorPrincipal,
                                          shape: BoxShape.circle
                                        ),
                                        child: Icon(Icons.money_off,
                                          color: Colors.white,
                                        ),
                                      )
                                    ],
                                  ),
                                  Container(
                                    child: Text('Gastos Totales',
                                      style: TextStyle(
                                        fontFamily: 'Jost',
                                        fontSize: 18,
                                        color: colorPrincipal,
                                        fontWeight: FontWeight.bold
                                      ),
                                    ),
                                  ),
                                  Container(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          child: Icon(Icons.attach_money,
                                            color: colorPrincipal,
                                          ),
                                        ),
                                        Container(
                                          child: Text('40000',
                                            style: TextStyle(
                                                fontFamily: 'Jost',
                                              fontSize: 16,
                                              color: colorPrincipal,
                                              fontWeight: FontWeight.bold
                                            ),
                                          )
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(width: 35),
                            Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: colorPrincipal,
                                borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.black12,
                                        spreadRadius: 1,
                                        blurRadius: 3,
                                        offset: Offset(0, 2)
                                    )
                                  ]
                              ),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            shape: BoxShape.circle
                                        ),
                                        child: Icon(Icons.attach_money,
                                          color: colorPrincipal,
                                        ),
                                      )
                                    ],
                                  ),
                                  Container(
                                    child: Text('Ingresos Totales',
                                      style: TextStyle(
                                          fontFamily: 'Jost',
                                        fontSize: 18,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold
                                      ),
                                    ),
                                  ),
                                  Container(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          child: Icon(Icons.attach_money,
                                            color: Colors.white,
                                          ),
                                        ),
                                        Container(
                                            child: Text('60000',
                                              style: TextStyle(
                                                  fontFamily: 'Jost',
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white
                                              ),
                                            )
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: 20,),
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black12,
                                    spreadRadius: 1,
                                    blurRadius: 3,
                                    offset: Offset(0, 2)
                                )
                              ]
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                child: Row(
                                  children: [
                                    Container(
                                      child: Icon(Icons.balance),
                                    ),
                                    SizedBox(width: 5,),
                                    Container(
                                      child: Text('Balance',
                                        style: TextStyle(
                                          fontFamily: 'Jost',
                                          fontWeight: FontWeight.w600,
                                          fontSize: 18
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                child: Row(
                                  children: [
                                    Container(
                                      child: Icon(Icons.attach_money),
                                    ),
                                    SizedBox(width: 5,),
                                    Container(
                                      child: Text('20000',
                                        style: TextStyle(
                                          fontFamily: 'Jost',
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
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
      ),
    );
  }
}
