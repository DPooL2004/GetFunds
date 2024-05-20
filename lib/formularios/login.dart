import 'package:flutter/material.dart';
import 'package:getfunds/colores.dart';
import 'package:getfunds/formularios/usuarios.dart';
import 'package:getfunds/home.dart';
import 'package:getfunds/vistas/ahorro.dart';

class Login extends StatefulWidget {

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  Usuarios mial = Usuarios();

  final _formKey = GlobalKey<FormState>();
  late String _emailController;
  late String _passwordController;

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
                        Text('Inicia Sesión',
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
                                if(value==null||value.isEmpty){
                                  return 'Ingrese su correo';
                                }else{
                                  return null;
                                }
                              },
                              onSaved: (value){
                                _emailController=value!;
                              },
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width*1,
                            child: TextFormField(
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
                              validator: (value){
                                if(value==null||value.isEmpty){
                                  return 'Ingrese su contraseña';
                                }else{
                                  return null;
                                }
                              },
                              onSaved: (value){
                                _passwordController=value!;
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        FilledButton(
                            style: FilledButton.styleFrom(
                                backgroundColor: Colors.transparent
                            ),
                            onPressed: (){},
                            child: Text("¿Olvidaste tu Contraseña?",
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
                            onPressed: ()async{
                              if(_formKey.currentState!.validate()){
                                _formKey.currentState!.save();
                                var dato = await mial.loginUsuario(_emailController, _passwordController);
                                if(dato==2){
                                  print('Contraseña Incorrecta');
                                }else if(dato==3){
                                  print('Correo Incorrecto');
                                }else if(dato==1){
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>home()));
                                }else{
                                  print('error');
                                }
                              }
                            },
                            child: Text("Iniciar Sesión",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'Jost'
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        FilledButton(
                          style: FilledButton.styleFrom(
                            backgroundColor: Colors.transparent
                          ),
                            onPressed: (){},
                            child: Text("¿No tienes una cuenta?",
                              style: TextStyle(
                                  color: colorPrincipal,
                                  fontFamily: 'Jost',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17
                              ),
                            )
                        )
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
