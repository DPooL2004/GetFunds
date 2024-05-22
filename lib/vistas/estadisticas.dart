import 'package:flutter/material.dart';
import 'package:getfunds/colores.dart';
import 'package:getfunds/vistas/ahorro.dart';
import 'package:getfunds/vistas/ajustes.dart';
import 'package:getfunds/vistas/estadisticas.dart';
import 'package:getfunds/vistas/home.dart';

class Estadisticas extends StatefulWidget {
  @override
  State<Estadisticas> createState() => _EstadisticasState();
}

class _EstadisticasState extends State<Estadisticas> {
  int _indexSeleccionado = 0;

  void _indexSeleccion(int index){
    setState(() {
      _indexSeleccionado = index;
    });

    switch(index){
      case 0:
        Navigator.push(context, MaterialPageRoute(builder: (context)=>home()));
        break;
      case 1:
        Navigator.push(context, MaterialPageRoute(builder: (context)=>Ahorro()));
        break;
      case 2:
        Navigator.push(context, MaterialPageRoute(builder: (context)=>Estadisticas()));
        break;
      case 3:
        Navigator.push(context, MaterialPageRoute(builder: (context)=>Ajustes()));
        break;

    }
  }

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
                /*ListView(
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
                /*Stack(
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
                )*/
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items:const[
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Inicio',
              backgroundColor: colorPrincipal
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.access_alarm_rounded),
              label: 'Ahorro',
              backgroundColor: colorPrincipal
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.accessibility_outlined),
              label: 'Estadisticas',
              backgroundColor: Colors.red
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.ad_units),
            label: 'Ajustes',
            backgroundColor: Colors.purple
          )
        ],
        type: BottomNavigationBarType.shifting,
      ),
    );
  }
}
