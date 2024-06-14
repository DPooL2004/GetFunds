import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:getfunds/colores.dart';
import 'package:fluttertoast/fluttertoast.dart';


import 'package:intl/intl.dart';

class InsertarMeta {
  void saveDatos({
    required String correo,
    required int valor,
    required String nombre,
    required int duracion
  }) async{
    FirebaseFirestore.instance.collection('Ahorro').add({
      'Correo': correo,
      'Monto_Mensual': valor,
      'Duracion_Meses': duracion,
      'Nombre': nombre
    }).then((value){
      Fluttertoast.showToast(
          msg: 'Meta Agregada! :)',
        backgroundColor: colorPrincipal,
        textColor: Colors.white,
          gravity: ToastGravity.BOTTOM,
          toastLength: Toast.LENGTH_SHORT
      );
    }).catchError((error){
      print('Datos no guardados');
    });
  }
}