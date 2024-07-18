import 'package:flutter/material.dart';
import 'package:getfunds/colores.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:getfunds/insertar/registrosAhorro.dart';
import 'package:getfunds/vistas/ahorro.dart';

class Modal_Ahorro extends StatefulWidget {
  @override
  State<Modal_Ahorro> createState() => _Modal_AhorroState();

  void mainBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return _ModalContent();
      },
    );
  }
}

class _Modal_AhorroState extends State<Modal_Ahorro> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class _ModalContent extends StatefulWidget {
  @override
  __ModalContentState createState() => __ModalContentState();
}


class __ModalContentState extends State<_ModalContent> {
  final InsertarMeta insertarMeta = InsertarMeta();
  final frm = GlobalKey<FormState>();
  late TextEditingController _correoUsuario;
  late int meta;
  late int duracion;
  late String nombre;

  @override
  void initState() {
    super.initState();
    _correoUsuario = TextEditingController();
    _getUserEmail();
  }

  Future<void> _getUserEmail() async {
    User? user = FirebaseAuth.instance.currentUser;
    setState(() {
      if (user != null) {
        _correoUsuario.text = user.email ?? 'No email available';
      } else {
        _correoUsuario.text = 'No user signed in';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      height: 500,
      width: MediaQuery.of(context).size.width*1,
      child: Column(
        children: [
          Text('Tu plan de Ahorro',
            style: TextStyle(
                color: colorPrincipal,
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontFamily: 'Jost'
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: Form(
              key: frm,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width*.42,
                        height: 100,
                        child: TextFormField(
                          cursorColor: colorSecundario,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              labelText: 'Meta',
                              labelStyle: TextStyle(
                                  fontFamily: 'Jost'
                              ),
                              floatingLabelStyle: TextStyle(
                                  color: colorSecundario,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Jost'
                              ),
                              prefixIcon: Icon(Icons.attach_money, color: colorPrincipal,),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: colorPrincipal)
                              )
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Ingrese la meta';
                            } else {
                              return null;
                            }
                          },
                          onSaved: (value) {
                            if (value != null) {
                              meta = int.parse(value!);
                            }
                          },
                        ),
                      ),
                      SizedBox(width: 20),
                      Container(
                        width: MediaQuery.of(context).size.width*.42,
                        height: 100,
                        child: TextFormField(
                          cursorColor: colorSecundario,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              labelText: 'Duracion',
                              labelStyle: TextStyle(
                                  fontFamily: 'Jost'
                              ),
                              floatingLabelStyle: TextStyle(
                                  color: colorSecundario,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Jost'
                              ),
                              prefixIcon: Icon(Icons.access_alarm_rounded, color: colorPrincipal,),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: colorPrincipal)
                              )
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Ingrese la meta';
                            } else {
                              return null;
                            }
                          },
                          onSaved: (value) {
                            if (value != null) {
                              duracion = int.parse(value!);
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width*1,
                    height: 100,
                    child: TextFormField(
                      cursorColor: colorSecundario,
                      decoration: InputDecoration(
                          labelText: 'Ponle nombre a tu Meta',
                          labelStyle: TextStyle(
                              fontFamily: 'Jost'
                          ),
                          floatingLabelStyle: TextStyle(
                              color: colorSecundario,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Jost'
                          ),
                          prefixIcon: Icon(Icons.abc_outlined, color: colorPrincipal,),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: colorPrincipal)
                          )
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Ingrese la meta';
                        } else {
                          return null;
                        }
                      },
                      onSaved: (value) {
                        if (value != null) {
                          nombre = value!;
                        }
                      },
                    ),
                  ),
                  Opacity(
                    opacity: 0,
                    child: Container(
                      width: MediaQuery.of(context).size.width*1,
                      height: 5,
                      child: TextFormField(
                        controller: _correoUsuario,
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
                            enabled: false
                        ),
                        validator: (value){
                          if(value==null||value.isEmpty)
                            return 'Ingrese un nombre de usuario';
                          else{
                            return null;
                          }
                        },
                        onSaved: (value){
                          _correoUsuario;
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            child: ElevatedButton(
              onPressed: (){
                if (frm.currentState!.validate()) {
                  frm.currentState!.save();
                  insertarMeta.saveDatos(
                    correo: _correoUsuario.text,
                    valor: meta,
                    duracion: duracion,
                    nombre: nombre,
                  );
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Ahorro()));
                }
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: colorPrincipal
              ),
              child: Text("Agregar Meta",
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Jost',
                    fontSize: 16,
                    fontWeight: FontWeight.w400
                ),
              ),
            ),
          )
        ],
      ),
    );
    ;
  }
}
