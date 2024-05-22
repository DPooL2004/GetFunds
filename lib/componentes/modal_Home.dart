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
            padding: EdgeInsets.all(20),
            height: 500,
            width: MediaQuery.of(context).size.width*1,
            child: Column(
              children: [
                Form(
                  key: frm,
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                            labelText: 'Ingresa la Categoria'),
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
                            labelText: 'Ingresa el Tipo'),
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
                            color: colorSecundario,
                          ),
                          prefixIcon: Icon(Icons.monetization_on,
                          color: colorSecundario,),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide(color: colorSecundario)
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
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
                        }, child: Text('Registrar')),
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
