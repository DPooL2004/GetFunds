import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Conexion extends StatefulWidget {
  @override
  State<Conexion> createState() => _ConexionState();
}

class _ConexionState extends State<Conexion> {
  late Future<QuerySnapshot> _futureData;

  @override
  void initState() {
    super.initState();
    _futureData = getData();
  }

  Future<QuerySnapshot> getData() async {
    return FirebaseFirestore.instance.collection('usuarios').get();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: _futureData,
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot){
          if(snapshot.connectionState == ConnectionState.waiting){
            return Center(child: CircularProgressIndicator());
          }else if(snapshot.hasError){
            return Center(child: Text('Error: ${snapshot.error}'));
          }else{
            return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index){
                Map<String, dynamic> data =snapshot.data!.docs[index].data() as Map<String, dynamic>;
              }
            );
          }
        }
      ),
    );
  }
}
