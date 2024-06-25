import 'package:flutter/material.dart';
import 'package:getfunds/colores.dart';
import 'package:getfunds/insertar/terminosMap.dart';


class terminosYCondiciones extends StatelessWidget {
  const terminosYCondiciones({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        home: listados()
    );
  }
}

class listados extends StatefulWidget {
  const listados({super.key});

  @override
  State<listados> createState() => _listadosState();
}

class _listadosState extends State<listados> {

  @override

  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          flexibleSpace: Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Padding(
                padding: const EdgeInsets.only(top: 12, left: 8),
                child: Image.asset(
                  'img/GetFundsLogoPequeño.png',
                  width: 80,
                  height: 80,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
        ),
        body: ListView.builder(
          itemCount: terminosmap.length,
          itemBuilder: (context, index){
            return Padding(
              padding: EdgeInsets.all(10.0),
              child: Card(
                elevation: 6.0,
                color: colorSecundario,
                child: ListTile(
                  /*leading: CircleAvatar(
                    backgroundImage: (NetworkImage(
                        terminosmap[index]['urlImagen']
                    )),
                  ),*/
                  title: Text(terminosmap[index]['Termino'],
                  style: TextStyle(
                    color: Colors.white
                  ),),
                  trailing: Icon(Icons.arrow_circle_down,
                    color: Colors.white,),
                  onTap: (){
                    showModalBottomSheet(context: context, builder:(context){
                      return Scaffold(
                        backgroundColor: Colors.transparent,
                        appBar: AppBar(
                          title: Text('Términos y Condiciones'),
                        ),
                        body: Container(
                          decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Colors.white,
                                  Colors.white,
                                ],
                              )
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: ListView(
                              children: [
                                /*CircleAvatar(
                                  radius: 100,
                                  backgroundImage: NetworkImage(
                                      terminosmap[index]['urlImagen']
                                  ),
                                ),*/
                                Column(
                                  children: [
                                    Text('Nombre:',
                                      style: TextStyle(
                                          color: colorPrincipal,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20
                                      ),),
                                    Text(terminosmap[index]['Termino'],
                                    style: TextStyle(
                                      fontSize: 16
                                    ),
                                    )
                                  ],
                                ),
                                Text(''),
                                Column(
                                  children: [
                                    Text('Descripción:',
                                    style: TextStyle(
                                      color: colorPrincipal,
                                        fontWeight: FontWeight.bold,
                                      fontSize: 20
                                    ),),
                                    Container(
                                      margin: EdgeInsets.only(left: 25),
                                      child: Text(terminosmap[index]['Descripción'],
                                      style: TextStyle(
                                        fontSize: 16
                                      ),),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    });
                  },
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
