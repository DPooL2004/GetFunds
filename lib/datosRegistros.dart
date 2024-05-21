import 'package:flutter/material.dart';

class DatosRegistro extends StatelessWidget {
  final Map<String, dynamic>data;
   DatosRegistro({required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text('Valor: ${data['Valor']}'),
        ],
      ),
    );
  }
}

