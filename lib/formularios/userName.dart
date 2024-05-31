import 'package:flutter/material.dart';
import 'package:getfunds/colores.dart';
import 'package:flutter/services.dart';
import 'package:getfunds/datosRegistros.dart';
import 'package:getfunds/formularios/login.dart';
import 'dart:io' as io;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

class UserName extends StatefulWidget {


  @override
  State<UserName> createState() => _UserNameState();
}

class _UserNameState extends State<UserName> {
  final _formKey = GlobalKey<FormState>();

  final String defaultImg = "img/avatares/default.png";
  late io.File? imagen = io.File('img/avatares/default.png');
  late String _nombre;

  String? _selectedImagePath;

  final List<String> _imagePaths = [
    'img/avatares/Avat_hombre1.png',
    'img/avatares/Avatar_hombre2.png',
    'img/avatares/Avat_hombre3.png',
    'img/avatares/Avatar_mujer1.png',
    'img/avatares/mujer.png',
    'img/avatares/mujer3.png',
  ];

  Future<void> _uploadImage(String imagePath) async {
    try {
      final byteData = await rootBundle.load(imagePath);
      final tempDir = await getTemporaryDirectory();
      final file = io.File('${tempDir.path}/${basename(imagePath)}');
      await file.writeAsBytes(byteData.buffer.asUint8List());

      final ref = FirebaseStorage.instance.ref().child('Avatares/${basename(imagePath)}');
      final uploadTask = ref.putFile(file);

      final snapshot = await uploadTask.whenComplete(() {});
      final downloadUrl = await snapshot.ref.getDownloadURL();

      await FirebaseFirestore.instance.collection('usuarios').add({'Avatar': downloadUrl, 'Nombre': _nombre});

      print("Imagen subida y URL guardada en Firestore: $downloadUrl");
    } catch (e) {
      print("Error al subir la imagen: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width*1,
        height: MediaQuery.of(context).size.height*1,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('img/Fondo_Verde.jpg'),
                fit: BoxFit.cover
            )
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50)
                  )
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 25, right: 25, top: 40, bottom: 40),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Text('Personaliza tu Perfil',
                          style: TextStyle(
                              color: colorPrincipal,
                              fontSize: 25,
                              fontWeight: FontWeight.bold
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width*1,
                            child: Column(
                              children: <Widget>[
                                if(_selectedImagePath != null)
                                  Image.asset(_selectedImagePath!),
                                GridView.builder(
                                  shrinkWrap: true,
                                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 3,
                                      crossAxisSpacing: 10,
                                      mainAxisSpacing: 10
                                    ),
                                    itemCount: _imagePaths.length,
                                    itemBuilder: (context, index){
                                      return GestureDetector(
                                        onTap: (){
                                          setState(() {
                                            _selectedImagePath = _imagePaths[index];
                                          });
                                        },
                                        child: Image.asset(_imagePaths[index]),
                                      );
                                    }
                                )
                              ],
                            )
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width*1,
                            child: TextFormField(
                              /*controller: _passwordController2,*/
                              cursorColor: colorSecundario,
                              decoration: InputDecoration(
                                labelText: 'Nombre de Usuario',
                                labelStyle: TextStyle(color: colorSecundario),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: colorSecundario),
                                    borderRadius: BorderRadius.circular(50)
                                ),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius:BorderRadius.circular(50),
                                    borderSide: BorderSide(color: colorSecundario)
                                ),
                              ),
                              validator: (value){
                                if(value==null||value.isEmpty)
                                  return 'Ingrese un nombre de usuario';
                                else{
                                  return null;
                                }
                              },
                              onSaved: (value){
                                _nombre=value!;
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Column(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width*1,
                          height: 50,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: colorPrincipal,
                                elevation: 3
                            ),
                            onPressed: ()async{

                              if(_formKey.currentState!.validate()){
                                _formKey.currentState!.save();
                                InsertarUsuarios insertarusuarios = InsertarUsuarios();

                                await insertarusuarios.saveDatos(
                                    imagen: io.File(_selectedImagePath!),
                                    userName: _nombre
                                );
                              }
                            },
                            child: Text("Registrarse",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'Jost'
                              ),
                            ),
                          ),
                        ),

                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
