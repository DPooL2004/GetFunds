import 'package:flutter/material.dart';
import 'package:getfunds/colores.dart';
import 'package:getfunds/vistas/ahorro.dart';
import 'package:getfunds/vistas/ajustes.dart';
import 'package:getfunds/vistas/estadisticas.dart';
import 'package:getfunds/vistas/home.dart';

class Ajustes extends StatefulWidget {
  @override
  State<Ajustes> createState() => _AjustesState();
}

class _AjustesState extends State<Ajustes> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ajustes',
          style: TextStyle(
            fontFamily: 'Jost',
          ),
        ),
        leading: Builder(
          builder: (context){
            return IconButton(
                onPressed: (){
                  Scaffold.of(context).openDrawer();
                },
                icon: Icon(Icons.menu)
            );
          },
        ),
        actions: [
          IconButton(
              onPressed: (){},
              icon: Image.asset('img/GetFundsLogoPequeño.png')
          )
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.transparent
              ),
              child: Text('Menú',
                style: TextStyle(
                  fontFamily: 'Jost',
                  fontWeight: FontWeight.bold,
                  fontSize: 25
                ),
              ),
            ),
            ListTile(
              leading: Container(
                height: 25,
                width: 25,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('img/hogar_Menu.png')
                  ),
                ),
              ),
              title: Text('Inicio',
                style: TextStyle(
                  color: colorPrincipal,
                  fontFamily: 'Jost',
                  fontWeight: FontWeight.bold,
                  fontSize: 15
                ),
              ),
              onTap: (){
                Navigator.push(context,
                    MaterialPageRoute(builder: (context)=>home())
                );
              },
            ),
            ListTile(
              leading: Container(
                height: 25,
                width: 25,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('img/hucha_menu.png')
                  ),
                ),
              ),
              title: Text('Ahorro',
                style: TextStyle(
                    color: colorPrincipal,
                    fontFamily: 'Jost',
                    fontWeight: FontWeight.bold,
                    fontSize: 15
                ),
              ),
              onTap: (){
                Navigator.push(context,
                    MaterialPageRoute(builder: (context)=>Ahorro())
                );
              },
            ),
            ListTile(
              leading: Container(
                height: 25,
                width: 25,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('img/estadisticas_menu.png')
                  ),
                ),
              ),
              title: Text('Estadisticas',
                style: TextStyle(
                    color: colorPrincipal,
                    fontFamily: 'Jost',
                    fontWeight: FontWeight.bold,
                    fontSize: 15
                ),
              ),
              onTap: (){
                Navigator.push(context,
                    MaterialPageRoute(builder: (context)=>Estadisticas())
                );
              },
            )
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black12,
                        spreadRadius: 1,
                        blurRadius: 3,
                        offset: Offset(0,2)
                    )
                  ],
                color: Colors.white,
                borderRadius: BorderRadius.circular(15)
              ),
              child: FilledButton(
                style: FilledButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20)
                ),
                onPressed: (){},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('img/circulo-de-usuario.png')
                            )
                          ),
                        ),
                        SizedBox(width: 10),
                        Container(
                          child: Text('Perfil',
                            style: TextStyle(
                              color: colorGris,
                              fontFamily: 'Jost',
                              fontSize: 20
                            ),
                          ),
                        )
                      ],
                    ),
                    Container(
                      height: 20,
                      width: 20,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('img/angulo-hacia-abajo.png')
                          )
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black12,
                        spreadRadius: 1,
                        blurRadius: 3,
                        offset: Offset(0,2)
                    )
                  ],
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15)
              ),
              child: FilledButton(
                style: FilledButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20)
                ),
                onPressed: (){},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SizedBox(width: 10),
                        Container(
                          child: Text('Terminos y Condiciones',
                            style: TextStyle(
                                color: colorGris,
                                fontFamily: 'Jost',
                                fontSize: 20
                            ),
                          ),
                        )
                      ],
                    ),
                    Container(
                      height: 20,
                      width: 20,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('img/angulo-hacia-abajo.png')
                          )
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: 10,),
            Container(
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black12,
                        spreadRadius: 1,
                        blurRadius: 3,
                        offset: Offset(0,2)
                    )
                  ],
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15)
              ),
              child: FilledButton(
                style: FilledButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20)
                ),
                onPressed: (){},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SizedBox(width: 10),
                        Container(
                          child: Text('Ayuda',
                            style: TextStyle(
                                color: colorGris,
                                fontFamily: 'Jost',
                                fontSize: 20
                            ),
                          ),
                        )
                      ],
                    ),
                    Container(
                      height: 20,
                      width: 20,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('img/interrogatorio.png')
                          )
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: 10,),
            Container(
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black12,
                        spreadRadius: 1,
                        blurRadius: 3,
                        offset: Offset(0,2)
                    )
                  ],
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15)
              ),
              child: FilledButton(
                style: FilledButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20)
                ),
                onPressed: (){},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SizedBox(width: 10),
                        Container(
                          child: Text('Cerrar Sesión',
                            style: TextStyle(
                                color: Colors.red,
                                fontFamily: 'Jost',
                                fontSize: 20
                            ),
                          ),
                        )
                      ],
                    ),
                    Container(
                      height: 20,
                      width: 20,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('img/salir.png')
                          )
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
