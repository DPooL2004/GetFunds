import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:getfunds/colores.dart';
import 'package:getfunds/vistas/ahorro.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:getfunds/vistas/estadisticas.dart';
import 'package:getfunds/vistas/home.dart';

class Ajustes extends StatefulWidget {
  @override
  State<Ajustes> createState() => _AjustesState();
}

class _AjustesState extends State<Ajustes> {
  String _correoUsuario = '';
  String? avatar;
  String? nombre;

  @override
  void initState() {
    super.initState();
    _getUserEmail();
    _traerCorreo();
  }

  Future<void> _getUserEmail() async {
    User? user = FirebaseAuth.instance.currentUser;
    setState(() {
      if (user != null) {
        setState(() {
          _correoUsuario = user.email ?? 'No email available';
        });
        _traerCorreo();
      } else {
        _correoUsuario = 'No user signed in';
      }
    });
  }

  Future <void> _traerCorreo()async{
    try{
      QuerySnapshot<Map<String, dynamic>> correoSnapshot = await FirebaseFirestore.instance.collection('usuarios')
          .where('Correo', isEqualTo: _correoUsuario)
          .get();

      if(correoSnapshot.docs.isNotEmpty){
        var correoFiltrado = correoSnapshot.docs.first.data();

        if(correoFiltrado !=null && correoFiltrado.containsKey('Avatar')){
          setState(() {
            avatar = correoFiltrado['Avatar'];
            nombre = correoFiltrado['Nombre'];// Actualizar la variable avatar con la ruta del avatar
          });
          print('Usuario $_correoUsuario');
          print('Avatar del usuario: $avatar');
        }else {
          print('El campo "avatar" no está presente en el documento o el documento es nulo.');
        }
      }else {
        print('No se encontraron usuarios con ese correo.');
      }
    }catch (error){
      print('$error');
    }
  }


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
                      children: <Widget>[
                        if(avatar != null)
                        Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(avatar!),
                            )
                          ),
                        ),
                        SizedBox(width: 10),
                        Container(
                          child: Text('Perfil: $nombre',
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
