import 'package:flutter/material.dart';
import 'package:getfunds/colores.dart';

class home extends StatefulWidget { // Make it StatefulWidget
  const home({super.key});

  @override
  State<home> createState() => _HomeState(); // Create a State class
}

class _HomeState extends State<home> { // State class for Home

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 15, left: 20),
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('img/GetFundsLogoPequeño.png'),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              width: 300,
              height: 150,
              decoration: BoxDecoration(
                  color: Color.fromRGBO(241,242,241,1),
                  borderRadius: BorderRadius.circular(10.0)
              ),
              child: Column(
                children: [
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Saldo Total',
                      style: TextStyle(
                        color: Color.fromRGBO(87, 87, 87, 1),
                        fontWeight: FontWeight.bold
                      ),),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
