import 'package:flutter/material.dart';
import 'package:getfunds/colores.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:getfunds/vistas/ahorro.dart';
import 'package:getfunds/vistas/ajustes.dart';
import 'package:getfunds/vistas/home.dart';
import 'package:fl_chart/fl_chart.dart';

class Estadisticas extends StatefulWidget {
  @override
  State<Estadisticas> createState() => _EstadisticasState();
}

class _EstadisticasState extends State<Estadisticas> {
  String _correoUsuario = '';

  @override
  void initState() {
    super.initState();
    _getUserEmail();
    fetchData1();
  }

  Future<void> _getUserEmail() async {
    User? user = FirebaseAuth.instance.currentUser;
    setState(() {
      if (user != null) {
        setState(() {
          _correoUsuario = user.email ?? 'No email available';
        });
      } else {
        _correoUsuario = 'No user signed in';
      }
    });
  }

  Future<Map<String, dynamic>> fetchData1() async {
    double totalIngresos = 0;
    double totalEgresos = 0;

    double balance = totalIngresos - totalEgresos;


    try {
      /*Consulta para todos los regsitros seung correo*/
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection('Registros')
          .where('Correo', isEqualTo: _correoUsuario).get();

      querySnapshot.docs.forEach((doc) {
        double valor = doc['Valor'].toDouble();
        String tipo = doc['Tipo'];

        if (tipo == 'Ingreso') {
          totalIngresos += valor;
        } else if (tipo == 'Egreso') {
          totalEgresos += valor;
        }
      });
    } catch (e) {
      print("Error fetching data: $e");
    }


    return {
      'totalIngresos': totalIngresos,
      'totalEgresos': totalEgresos,
      'balance': balance
    };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                /*Inicio Barra con nombre de Sección y Botón de Agregar*/
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('img/GetFundsLogoPequeño.png')
                        )
                      ),
                    ),
                  ],
                ),

                /*Bloques Estadisticos*/
                SingleChildScrollView(
                  child: Container(
                    child: Column(
                      children: [
                        FutureBuilder(
                            future: fetchData1(),
                            builder: (context, snapshot){
                              if (snapshot.connectionState == ConnectionState.waiting) {
                                return Center(child: CircularProgressIndicator());
                              } else if (snapshot.hasError) {
                                return Center(child: Text('Error: ${snapshot.error}'));
                              } else if (!snapshot.hasData) {
                                return Center(child: Text('No data available'));
                              }else{
                                double totalIngresos = snapshot.data!['totalIngresos'] ?? 0.0;
                                double totalEgresos = snapshot.data!['totalEgresos'] ?? 0.0;

                                return Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          padding: EdgeInsets.all(10),
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.circular(10),
                                              boxShadow: [
                                                BoxShadow(
                                                    color: Colors.black12,
                                                    spreadRadius: 1,
                                                    blurRadius: 3,
                                                    offset: Offset(0, 2)
                                                )
                                              ]
                                          ),
                                          child: Column(
                                            children: [
                                              Row(
                                                children: [
                                                  Container(
                                                    decoration: BoxDecoration(
                                                        color: colorPrincipal,
                                                        shape: BoxShape.circle
                                                    ),
                                                    child: Icon(Icons.money_off,
                                                      color: Colors.white,
                                                    ),
                                                  )
                                                ],
                                              ),
                                              Container(
                                                child: Text('Gastos Totales',
                                                  style: TextStyle(
                                                      fontFamily: 'Jost',
                                                      fontSize: 18,
                                                      color: colorPrincipal,
                                                      fontWeight: FontWeight.bold
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: [
                                                    Container(
                                                      child: Icon(Icons.attach_money,
                                                        color: colorPrincipal,
                                                      ),
                                                    ),
                                                    Container(
                                                        child: Text(totalEgresos.toString(),
                                                          style: TextStyle(
                                                              fontFamily: 'Jost',
                                                              fontSize: 16,
                                                              color: colorPrincipal,
                                                              fontWeight: FontWeight.bold
                                                          ),
                                                        )
                                                    )
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                        SizedBox(width: 35),
                                        Container(
                                          padding: EdgeInsets.all(10),
                                          decoration: BoxDecoration(
                                              color: colorPrincipal,
                                              borderRadius: BorderRadius.circular(10),
                                              boxShadow: [
                                                BoxShadow(
                                                    color: Colors.black12,
                                                    spreadRadius: 1,
                                                    blurRadius: 3,
                                                    offset: Offset(0, 2)
                                                )
                                              ]
                                          ),
                                          child: Column(
                                            children: [
                                              Row(
                                                children: [
                                                  Container(
                                                    decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        shape: BoxShape.circle
                                                    ),
                                                    child: Icon(Icons.attach_money,
                                                      color: colorPrincipal,
                                                    ),
                                                  )
                                                ],
                                              ),
                                              Container(
                                                child: Text('Ingresos Totales',
                                                  style: TextStyle(
                                                      fontFamily: 'Jost',
                                                      fontSize: 18,
                                                      color: Colors.white,
                                                      fontWeight: FontWeight.bold
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: [
                                                    Container(
                                                      child: Icon(Icons.attach_money,
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                    Container(
                                                        child: Text(totalIngresos.toString(),
                                                          style: TextStyle(
                                                              fontFamily: 'Jost',
                                                              fontSize: 16,
                                                              fontWeight: FontWeight.bold,
                                                              color: Colors.white
                                                          ),
                                                        )
                                                    )
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                    SizedBox(height: 20,),
                                    Container(
                                      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(10),
                                          boxShadow: [
                                            BoxShadow(
                                                color: Colors.black12,
                                                spreadRadius: 1,
                                                blurRadius: 3,
                                                offset: Offset(0, 2)
                                            )
                                          ]
                                      ),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            child: Row(
                                              children: [
                                                Container(
                                                  child: Icon(Icons.balance),
                                                ),
                                                SizedBox(width: 5,),
                                                Container(
                                                  child: Text('Balance',
                                                    style: TextStyle(
                                                        fontFamily: 'Jost',
                                                        fontWeight: FontWeight.w600,
                                                        fontSize: 18
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                          Container(
                                            child: Row(
                                              children: [
                                                Container(
                                                  child: Icon(Icons.attach_money),
                                                ),
                                                SizedBox(width: 5,),
                                                Container(
                                                  child: Text((totalIngresos - totalEgresos).toString(),
                                                    style: TextStyle(
                                                        fontFamily: 'Jost',
                                                        fontSize: 18,
                                                        fontWeight: FontWeight.w600
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                );
                              }
                            }
                        )
                      ],
                    ),
                  ),
                ),

                /*Graficas*/
                SingleChildScrollView(
                  child: Container(
                    child: Column(
                      children: [
                        FutureBuilder<Map<String, dynamic>>(
                            future: fetchData1(),
                            builder: (context, snapshot){
                              if (snapshot.connectionState == ConnectionState.waiting) {
                                return Center(child: CircularProgressIndicator());
                              } else if (snapshot.hasError) {
                                return Center(child: Text('Error: ${snapshot.error}'));
                              } else if (!snapshot.hasData) {
                                return Center(child: Text('No data available'));
                              }else{
                                double totalIngresos = snapshot.data!['totalIngresos'] ?? 0.0;
                                double totalEgresos = snapshot.data!['totalEgresos'] ?? 0.0;
                                List<dynamic> ingresosData = snapshot.data!['ingresos'] ?? [];
                                List<dynamic> egresosData = snapshot.data!['egresos'] ?? [];
                                print(ingresosData);

                                List<BarChartGroupData> ingresosGroups = List.generate(
                                  ingresosData.length,
                                      (index) {
                                    var valor = ingresosData[index]['Valor'];
                                    return BarChartGroupData(
                                      x: index,
                                      barRods: [
                                        BarChartRodData(
                                          toY: (valor is num) ? valor.toDouble() : 0.0,
                                          color: Colors.green,
                                          width: 10,
                                        ),
                                      ],
                                    );
                                  },
                                );

                                List<BarChartGroupData> egresosGroups = List.generate(
                                  egresosData.length,
                                      (index) {
                                    var valor = egresosData[index]['Valor'];
                                    return BarChartGroupData(
                                      x: index,
                                      barRods: [
                                        BarChartRodData(
                                          toY: (valor is num) ? valor.toDouble() : 0.0,
                                          color: Colors.red,
                                          width: 10,
                                        ),
                                      ],
                                      showingTooltipIndicators: [0],
                                    );
                                  },
                                );

                                return Column(
                                  children: [
                                    Container(
                                      height: 200,
                                      padding: EdgeInsets.all(10),
                                      child: BarChart(
                                        BarChartData(
                                          alignment: BarChartAlignment.spaceAround,
                                          barGroups: [
                                            BarChartGroupData(
                                              x: 0,
                                              barRods: [
                                                BarChartRodData(
                                                    toY: totalIngresos,
                                                  color: Colors.green,
                                                  width: 30
                                                )
                                              ]
                                            ),
                                            BarChartGroupData(
                                                x: 1,
                                              barRods: [
                                                BarChartRodData(
                                                    toY: totalEgresos,
                                                  color: Colors.red,
                                                  width: 30
                                                )
                                              ],
                                              showingTooltipIndicators: [1]
                                            )
                                          ],
                                          borderData: FlBorderData(show: false),
                                          titlesData: FlTitlesData(
                                            show: true,
                                            bottomTitles: AxisTitles(
                                              sideTitles: SideTitles(
                                                showTitles: true,
                                                getTitlesWidget: (double value, TitleMeta meta){
                                                  switch (value.toInt()){
                                                    case 0:
                                                      return Text('Ingresos');
                                                    case 1:
                                                      return Text('Engresos');
                                                    case 2:
                                                      return Text('');
                                                    default:
                                                      return SizedBox();
                                                  }
                                                },
                                              )
                                            ),
                                            leftTitles: AxisTitles(
                                              sideTitles: SideTitles(showTitles: false)
                                            )
                                          )
                                        )
                                      ),
                                    ),
                                  ],
                                );
                              }
                            }
                        ),
                      ],
                    ),
                  ),
                ),


                /*Barra de Navegación*/
                Container(
                  padding: EdgeInsets.only(top: 0, bottom: 10),
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: colorPrincipal,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        FilledButton(
                            style: FilledButton.styleFrom(
                                backgroundColor: Colors.transparent
                            ),
                            onPressed: (){
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context)=>home())
                              );
                            },
                            child: Container(
                              height: 25,
                              width: 25,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage('img/hogarGetFunds.png',)
                                  )
                              ),
                            )
                        ),
                        FilledButton(
                            style: FilledButton.styleFrom(
                                backgroundColor: Colors.transparent
                            ),
                            onPressed: (){
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context)=>Ahorro())
                              );
                            },
                            child: Container(
                              height: 25,
                              width: 25,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage('img/carteraGetFunds.png')
                                  )
                              ),
                            )
                        ),
                        FilledButton(
                            style: FilledButton.styleFrom(
                                backgroundColor: Colors.transparent
                            ),
                            onPressed: (){
                            },
                            child: Container(
                              height: 25,
                              width: 25,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage('img/estadisticasGetFunds.png')
                                  )
                              ),
                            )
                        ),
                        FilledButton(
                            style: FilledButton.styleFrom(
                                backgroundColor: Colors.transparent
                            ),
                            onPressed: (){
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context)=>Ajustes())
                              );
                            },
                            child: Container(
                              height: 25,
                              width: 25,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage('img/ajustesGetFunds.png')
                                  )
                              ),
                            )
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
