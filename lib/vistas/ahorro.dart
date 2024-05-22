import 'package:flutter/material.dart';
import 'package:getfunds/colores.dart';
import 'package:getfunds/componentes/modal_Ahorro.dart';
import 'package:getfunds/vistas/ajustes.dart';
import 'package:getfunds/vistas/estadisticas.dart';
import 'package:getfunds/vistas/home.dart';

class Ahorro extends StatelessWidget {
  Modal_Ahorro modal = Modal_Ahorro();

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
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(top: 0, bottom: 10, left: 20, right: 20),
                    child: ListView(
                      children: [
                        ListTile(
                          title: Text("Viajes"),
                          subtitle: Text('300000'),
                          leading: Container(
                            height: 20,
                            width: 20,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('img/cartera.png')
                              )
                            ),
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
      ),
    );
  }
}

