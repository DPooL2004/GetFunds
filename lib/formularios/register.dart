import 'package:flutter/material.dart';
import 'package:getfunds/colores.dart';
import 'package:getfunds/formularios/login.dart';
import 'package:getfunds/formularios/userName.dart';
import 'package:getfunds/formularios/usuarios.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Register extends StatefulWidget {

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  Usuarios mial = Usuarios();

  final _formKey = GlobalKey<FormState>();
  late String _emailController;
  late String _passwordController;
  final _passwordController2 = TextEditingController();
  final _confirmPassword = TextEditingController();

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
                                if(value==null||value.isEmpty)
                                  return 'Ingrese su Correo';
                                else{
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
                              controller: _passwordController2,
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
                                if(value==null||value.isEmpty)
                                  return 'Ingrese su Contraseña';
                                else{
                                  return null;
                                }
                              },
                              onSaved: (value){
                                _passwordController=value!;
                              },
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width*1,
                            child: TextFormField(
                              controller: _confirmPassword,
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
                              validator:(value){
                                if(value==null||value.isEmpty){
                                  Fluttertoast.showToast(msg: 'Confirma tu contraseña');
                                }
                                if(value!=_passwordController2.text){
                                  Fluttertoast.showToast(msg: 'Las contraseñas no coinciden, por favor vuelve a escribirla');
                                }
                                return null;
                              }
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
                            onPressed: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>Login()));
                            },
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
                            onPressed: ()async{
                              if(_formKey.currentState!.validate()){
                                _formKey.currentState!.save();
                                var dato = await mial.registerUsuario(_emailController, _passwordController);
                                if(dato==3){
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>UserName()));
                                }else if(dato==1){
                                  Fluttertoast.showToast(
                                      msg: 'Contraseña Débil',
                                    backgroundColor: Colors.red,
                                    textColor: Colors.white,
                                    gravity: ToastGravity.BOTTOM,
                                    toastLength: Toast.LENGTH_SHORT
                                  );
                                }else if(dato==2){
                                  Fluttertoast.showToast(
                                      msg: 'Correo ya Registrado',
                                      backgroundColor: Colors.yellow,
                                      textColor: Colors.white,
                                      gravity: ToastGravity.BOTTOM,
                                      toastLength: Toast.LENGTH_SHORT
                                  );
                                }
                              }
                            },
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
