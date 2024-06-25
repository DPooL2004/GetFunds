import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
class CerrarSesion extends StatefulWidget {
  const CerrarSesion({super.key});

  @override
  State<CerrarSesion> createState() => _CerrarSesionState();
}

class _CerrarSesionState extends State<CerrarSesion> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  @override
  void initState() {
    super.initState();
    _logout();
  }
  void _logout() async {
    await auth.signOut();
    Navigator.of(context).pushNamed('/');
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cerrando sesión'),
      ),
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
