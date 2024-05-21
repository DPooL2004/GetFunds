import 'package:flutter/material.dart';
import 'package:getfunds/colores.dart';
import 'package:getfunds/vistas/ajustes.dart';
import 'package:getfunds/vistas/estadisticas.dart';
import 'package:getfunds/vistas/home.dart';

class Ahorro extends StatelessWidget {
  const Ahorro({super.key});

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
                Expanded(
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
        
                /*Barra de Navegación*/
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
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
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
