import 'dart:io' as io;
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class InsertarDatos{
  final FirebaseStorage _storage = FirebaseStorage.instance;
  void saveDatos({
    required String categoria,
    required DateTime fecha,
    required String tipo,
    required int valor,
  }) async {
    FirebaseStorage storage = FirebaseStorage.instance;
    FirebaseFirestore.instance.collection('Registros').add({
      'Categoria':categoria,
      'Fecha':Timestamp.fromDate(fecha),
      'Tipo': tipo,
      'Valor': valor,

    }).then((value){
      print('Enviado');
    }).catchError((error){
      print('Datos no guardados');
    });
  }
}