import 'package:flutter/material.dart';
import 'package:getfunds/colores.dart';
import 'package:getfunds/insertar/insertarHome.dart';

class Modal_Home{
  final InsertarDatos insertarDatos = InsertarDatos();
  final frm = GlobalKey<FormState>();
  /*Controladores*/
    late String _Categoria;
    /*late DateTime _Fecha;*/
    late String _Tipo;
    late int _Valor;

  mainBottomSheet(BuildContext context){
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context){
          return Container(
            margin: EdgeInsets.only(top: 50),
            padding: EdgeInsets.all(20),
            height: 350,
            width: MediaQuery.of(context).size.width*1,
            child: Column(
              children: [
                Form(
                  key: frm,
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                            labelText: 'Ingresa la Categoria',
                            labelStyle: TextStyle(

                            ),
                            prefixIcon: Icon(Icons.category,
                              color: colorSecundario,),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide(color: colorSecundario)
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide(color: colorSecundario)
                            )
                        ),
                        validator: (value){
                          if(value==null || value.isEmpty)
                            return 'Ingrese el Documento.';
                          else{
                            return null;
                          }
                        },
                        onSaved: (value){
                          _Categoria=value!;
                        },
                      ),
                      SizedBox(height: 10,),
                      TextFormField(
                        decoration: InputDecoration(
                            labelText: 'Ingresa el Tipo',
                            labelStyle: TextStyle(

                            ),
                            prefixIcon: Icon(Icons.merge_type,
                              color: colorSecundario,),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide(color: colorSecundario)
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide(color: colorSecundario)
                            )
                        ),
                        validator: (value){
                          if(value==null || value.isEmpty)
                            return 'Ingrese el Documento.';
                          else{
                            return null;
                          }
                        },
                        onSaved: (value){
                          _Tipo=value!;
                        },
                      ),
                      SizedBox(height: 10,),

                      TextFormField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            labelText: 'Ingresa el Valor',
                          labelStyle: TextStyle(

                          ),
                          prefixIcon: Icon(Icons.monetization_on,
                          color: colorSecundario,),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(color: colorSecundario)
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(color: colorSecundario)
                          )
                        ),
                        validator: (value){
                          if(value==null || value.isEmpty)
                            return 'Ingrese el Documento.';
                          else{
                            return null;
                          }
                        },
                        onSaved: (value){
                          _Valor= int.parse(value!);
                        },
                      ),
                      SizedBox(height: 10,),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(onPressed: (){
                          if(frm.currentState!.validate()){
                              frm.currentState!.save();
                              insertarDatos.saveDatos(
                                  categoria: _Categoria,
                                  tipo: _Tipo,
                                  valor: _Valor);
                          }
                        }, style: ElevatedButton.styleFrom(
                          backgroundColor: colorPrincipal,
                        ),
                            child: Text('Registrar',
                            style: TextStyle(
                              color: Colors.white
                            ),)),
                      )
                    ],
                  ),
                )
              ],
            ),
          );
        }
    );
  }
}
