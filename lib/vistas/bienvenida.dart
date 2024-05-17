import 'package:flutter/material.dart';
import 'package:getfunds/formularios/login.dart';
import 'package:getfunds/formularios/register.dart';
import 'package:getfunds/colores.dart';

class Bienvenida extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width*1,
        height: MediaQuery.of(context).size.height*1,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('img/texturaSplash.jpg',),
                fit: BoxFit.cover
            )
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Image.asset('img/GetFundsLogoPequeño.png'),
            SizedBox(
              height: 150,
            ),
            Container(
              padding: EdgeInsets.only(left: 25, right: 25, top: 50),
              width: MediaQuery.of(context).size.width*1,
              height: 350,
              decoration: BoxDecoration(
                  color: colorPrincipal,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50),
                  )
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("¡Bienvenido!",
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Jost',
                        fontSize: 30,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text("¿Estás listo para controlar mejor tu dinero? ¡Registrate o Inicia Sesión y comienza a hacerlo!",
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Jost',
                      fontSize: 17,
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: colorSecundario,
                              elevation: 3
                          ),
                          onPressed: (){
                            Navigator.push(
                                context, MaterialPageRoute(builder: (context) => Register())
                            );
                          },
                          child: Text("Registrarse",
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Jost',
                                fontWeight: FontWeight.bold,
                                fontSize: 15
                            ),
                          )
                      ),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              elevation: 3
                          ),
                          onPressed: (){
                            Navigator.push(
                                context, MaterialPageRoute(builder: (context) => Login())
                            );
                          },
                          child: Text("Iniciar Sesión",
                            style: TextStyle(
                                color: colorPrincipal,
                                fontFamily: 'Jost',
                                fontWeight: FontWeight.bold,
                                fontSize: 15
                            ),
                          )
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
