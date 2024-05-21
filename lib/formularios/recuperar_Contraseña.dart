import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
import 'package:getfunds/colores.dart';
import 'package:getfunds/formularios/login.dart';
import 'package:getfunds/formularios/usuarios.dart';

class Recuperacion extends StatefulWidget {

  @override
  State<Recuperacion> createState() => _RecuperacionState();
}

class _RecuperacionState extends State<Recuperacion> {

  Usuarios mial = Usuarios();

  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();

  void dispose(){
    _emailController.dispose();
    super.dispose();
  }

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
                        Text('Recupera tu contraseña',
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
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width*1,
                            child: TextFormField(
                              controller: _emailController,
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
                              validator: (value){
                                if(value==null||value.isEmpty)
                                  return 'Ingrese su Correo';
                                else{
                                  return null;
                                }
                              },
                            ),
                          ),
                        ],
                      ),
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
                            onPressed: (){
                              ResetPassword();
                            },
                            child: Text("Enviar Correo",
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
  Future ResetPassword()async{
    try{
      await FirebaseAuth.instance.sendPasswordResetEmail(email: _emailController.text.trim());
      Navigator.of(context).popUntil((route) => route.isActive);
      Fluttertoast.showToast(
          msg: 'Correo Enviado',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: colorPrincipal,
        textColor: Colors.white
      );
      Navigator.push(context, 
          MaterialPageRoute(builder: (contexr)=>Login())
      );
    }on FirebaseAuthException catch(e){
      print(e);
      Navigator.of(context).pop();
      Fluttertoast.showToast(
          msg: 'Correo no válido',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.red,
          textColor: Colors.white
      );
    }
  }
}
