import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late Future<QuerySnapshot> _futureData;


  @override
  void initState() {
    super.initState();
    _futureData = getData();
  }

  Future<QuerySnapshot> getData() async {
    return FirebaseFirestore.instance.collection('Registros').get();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder<QuerySnapshot>(
        future: _futureData,
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return Center(child: Text('No data found'));
          } else {
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      Map<String, dynamic> data = snapshot.data!.docs[index].data() as Map<String, dynamic>;
                      return GestureDetector(
                        /*onTap: () {
                          // Acciones a realizar cuando se toca el elemento
                        },*/
                        child: ExpansionTile(
                          backgroundColor: Colors.grey,

                          title: Text(data['Categoria']),
                          leading: Icon(Icons.accessibility_outlined),
                          children: [
                            Text('Valor: ${data['Valor']}'),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}


