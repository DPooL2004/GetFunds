import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io' as io;
import 'package:cloud_firestore/cloud_firestore.dart';

class InsertarUsuarios{
   final FirebaseStorage _storage = FirebaseStorage.instance;

  Future <void> saveDatos({
      required String imagen,
      required String userName,
      required String correo
  }) async {
    try {
      FirebaseFirestore.instance.collection('usuarios').add({
        'Nombre': userName,
        'Avatar': imagen,
        'Correo': correo
      });
    } catch (error){
      throw error;
    }
    /*}).then((value){
      print('Enviado');
    }).catchError((error){
      print('Datos no guardados');
    });*/
  }
}

