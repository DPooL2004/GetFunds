import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class InsertarUsuarios{
   final FirebaseStorage _storage = FirebaseStorage.instance;

  Future <void> saveDatos({
      required String imagen,
      required String userName,
      required String correo,
      required String uid
  }) async {
    try {
      FirebaseFirestore.instance.collection('usuarios').add({
        'Nombre': userName,
        'Avatar': imagen,
        'Correo': correo,
        'Uid': uid
      });
    } catch (error){
      throw error;
    }
  }
}

