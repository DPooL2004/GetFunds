import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io' as io;
import 'package:cloud_firestore/cloud_firestore.dart';

class InsertarUsuarios{
   final FirebaseStorage _storage = FirebaseStorage.instance;

  Future <void> saveDatos({
      required io.File imagen,
      required String userName
  }) async {
    try{
      FirebaseStorage storage = FirebaseStorage.instance;
      Reference ref=storage.ref().child('Avatares/${DateTime.now().toString()}');
      UploadTask uploadTask = ref.putFile(imagen!);
      TaskSnapshot snapshot = await uploadTask;
      String img = await snapshot.ref.getDownloadURL();

      FirebaseFirestore.instance.collection('usuarios').add({
        'Nombre': userName,
        'Avatar': imagen
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

