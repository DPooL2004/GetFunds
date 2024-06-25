import 'package:flutter/material.dart';
import 'package:getfunds/colores.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:url_launcher/url_launcher.dart';

class Ayuda extends StatefulWidget {
   Ayuda({super.key});


  @override
  State<Ayuda> createState() => _AyudaState();
}

class _AyudaState extends State<Ayuda> {
  final _mensajeController = TextEditingController() ;
  late TextEditingController _correoUsuario;

  @override

  void initState() {
    super.initState();
    _correoUsuario = TextEditingController();
    _getUserEmail();
  }

  Future<void> _getUserEmail() async {
    User? user = FirebaseAuth.instance.currentUser;
    setState(() {
      if (user != null) {
        _correoUsuario.text = user.email ?? 'No email available';
      } else {
        _correoUsuario.text = 'No user signed in';
      }
    });
  }
  void _sendMessage() async {
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: 'dsrp002@gmail.com',
      queryParameters: {
        'subject': 'Mensaje de la app GetFunds',
        'body': _mensajeController.text,
      },
    );

    if (await canLaunchUrl(emailLaunchUri)) {
      await launchUrl(emailLaunchUri);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('No se pudo abrir la app de correo electrónico'),
        ),
      );
    }
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          flexibleSpace: Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Padding(
                padding: const EdgeInsets.only(top: 12, left: 8),
                child: Image.asset(
                  'img/GetFundsLogoPequeño.png',
                  width: 80,
                  height: 80,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
        ),
        body: Column(
          children: [
            Container(
              child: Center(child: Text('¡Contactanos!',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18
                ),
              ),),
            ),
            Container(
              margin: EdgeInsets.only(left: 7),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Center(child: Text('Bienvenido a la Sección de ayuda, contactate'
                    ' con nuestro equipo de Soporte mediante el formulario, estamos'
                    ' aqui para ayudarte!',
                  style: TextStyle(
                      color: Colors.grey
                  ),)),
              ),
            ),
            Container(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: 35,
                      height: 35,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        color: colorPrincipal,
                      ),
                      child: Icon(Icons.home_outlined,
                        color: Colors.white,),
                    ),
                  ),
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Locación',
                          style: TextStyle(
                              fontWeight: FontWeight.bold
                          ),),
                        Text('Km 4 Vía Bogotá',
                          style: TextStyle(
                              color: Colors.grey
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 10),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: 35,
                      height: 35,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        color: colorPrincipal,
                      ),
                      child: Icon(Icons.home_outlined,
                        color: Colors.white,),
                    ),
                  ),
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Telefono',
                          style: TextStyle(
                              fontWeight: FontWeight.bold
                          ),),
                        Text('(+57)3108803062',
                          style: TextStyle(
                              color: Colors.grey
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 35),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: 35,
                      height: 35,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        color: colorPrincipal,
                      ),
                      child: Icon(Icons.mail_outline,
                        color: Colors.white,),
                    ),
                  ),
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Correo',
                          style: TextStyle(
                              fontWeight: FontWeight.bold
                          ),),
                        Text('getFunds@gmail.com',
                          style: TextStyle(
                              color: Colors.grey
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),

            /*Captura el Correo del Usuario*/
            Container(
              margin: EdgeInsets.only(left: 40, right: 40, top: 40),
              height: 10,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: _correoUsuario,
                  cursorColor: colorSecundario,
                  decoration: InputDecoration(
                      labelStyle: TextStyle(color: colorSecundario),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: colorSecundario),
                          borderRadius: BorderRadius.circular(50)
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderRadius:BorderRadius.circular(50),
                          borderSide: BorderSide(color: colorSecundario)
                      ),
                      enabled: false
                  ),
                  validator: (value){
                    if(value==null||value.isEmpty)
                      return 'Ingrese un nombre de usuario';
                    else{
                      return null;
                    }
                  },
                  onSaved: (value){
                    _correoUsuario;
                  },
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 40, right: 40, top: 25),
              child: TextFormField(
                controller: _mensajeController,
                decoration: InputDecoration(
                  labelText: 'Deja tu Mensaje',
                  labelStyle: TextStyle(),
                  prefixIcon: Icon(
                    Icons.messenger_outline_outlined,
                    color: colorSecundario,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: colorSecundario),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  floatingLabelStyle: TextStyle(color: colorSecundario),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 15),
              child: ElevatedButton(
                  onPressed: _sendMessage,
                  child: Text('Enviar Mensaje',
                  style: TextStyle(
                    color: Colors.white
                  ),),
              style: ElevatedButton.styleFrom(
                backgroundColor: colorPrincipal
              ),
              ),
            )
          ],
        ),
      ),
    );
  }
}