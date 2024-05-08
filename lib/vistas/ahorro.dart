import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';

class Ahorro extends StatelessWidget {
  const Ahorro({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              /*Inicio Barra con nombre de Sección y Botón de Agregar*/
              Row(
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
                      backgroundColor: Color.fromRGBO(42,114,33,1),
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

              /*Imagen de Cerdito*/
              Transform.rotate(
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

              /*Contenedores de Ahorro*/
              /*Column(
                children: [
                  ListTile(
                    title: Text("Viajes"),
                    subtitle: Text('300000'),
                    leading: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('img/cartera.png')
                        )
                      ),
                    ),
                  )
                ],
              ),*/

              /*Barra de Navegación*/
              Stack(
                alignment: Alignment.center,
                children: [
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
