import 'package:flutter/material.dart';
import 'package:getfunds/colores.dart';

class Modal_Ahorro{
  final meta = TextEditingController();

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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 160,
                        height: 50,
                        child: TextField(
                          cursorColor: colorSecundario,
                          controller: meta,
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
                            prefixIcon: Icon(Icons.add_card, color: colorPrincipal,),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: colorPrincipal)
                            )
                          ),
                        ),
                      ),
                      SizedBox(width: 5),
                      Container(
                        width: 160,
                        height: 50,
                        child: TextField(
                          cursorColor: colorSecundario,
                          controller: meta,
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
                        ),
                      ),
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