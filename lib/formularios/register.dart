import 'package:flutter/material.dart';

class Register extends StatelessWidget {
  final Color colorPrincipal = Color.fromRGBO(17,152,34,1);
  final Color colorSecundario = Color.fromRGBO(42,114,33,1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width*1,
        height: MediaQuery.of(context).size.height*1,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('img/Fondo_Verde.jpg'),
            fit: BoxFit.cover
          )
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(50)
                )
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 25, right: 25, top: 40, bottom: 40),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Text('Registrate',
                          style: TextStyle(
                            color: colorPrincipal,
                            fontSize: 25,
                            fontWeight: FontWeight.bold
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Column(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width*1,
                          child: TextField(
                            cursorColor: colorSecundario,
                            decoration: InputDecoration(
                              labelText: 'Correo',
                              labelStyle: TextStyle(color: colorSecundario),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: colorSecundario),
                                borderRadius: BorderRadius.circular(50)
                              ),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius:BorderRadius.circular(50),
                                  borderSide: BorderSide(color: colorSecundario)
                              ),

                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width*1,
                          child: TextField(
                            cursorColor: colorSecundario,
                            decoration: InputDecoration(
                              labelText: 'Contraseña',
                              labelStyle: TextStyle(color: colorSecundario),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: colorSecundario),
                                  borderRadius: BorderRadius.circular(50)
                              ),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius:BorderRadius.circular(50),
                                  borderSide: BorderSide(color: colorSecundario)
                              ),

                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width*1,
                          child: TextField(
                            cursorColor: colorSecundario,
                            decoration: InputDecoration(
                              labelText: 'Confirmar Contraseña',
                              labelStyle: TextStyle(color: colorSecundario),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: colorSecundario),
                                  borderRadius: BorderRadius.circular(50)
                              ),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius:BorderRadius.circular(50),
                                  borderSide: BorderSide(color: colorSecundario)
                              ),

                            ),
                          ),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        FilledButton(
                          style: FilledButton.styleFrom(
                            backgroundColor: Colors.transparent
                          ),
                            onPressed: (){},
                            child: Text("¿Ya tienes una cuenta?",
                              style: TextStyle(
                                color: colorPrincipal,
                                fontFamily: 'Jost',
                                fontWeight: FontWeight.bold,
                                fontSize: 15
                              ),
                            )
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Column(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width*1,
                          height: 50,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: colorPrincipal,
                              elevation: 3
                            ),
                            onPressed: (){},
                            child: Text("Registrarse",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Jost'
                              ),
                            ),
                          ),
                        ),

                      ],
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
