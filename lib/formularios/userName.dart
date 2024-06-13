import 'package:flutter/material.dart';
import 'package:getfunds/colores.dart';
import 'package:flutter/services.dart';
import 'package:getfunds/datosRegistros.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:getfunds/vistas/home.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserName extends StatefulWidget {


  @override
  State<UserName> createState() => _UserNameState();
}

class _UserNameState extends State<UserName> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _correoUsuario;

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

  Future<void> _uploadImage(String image) async {
    try {
      // Cargar imagen desde assets
      ByteData byteData = await rootBundle.load(image);
      Uint8List imageData = byteData.buffer.asUint8List();

      // Crear referencia en Firebase Storage
      final fileName = 'Avatares/boxer_${DateTime.now().millisecondsSinceEpoch}.png';
      final ref = FirebaseStorage.instance.ref().child(fileName);

      // Subir a Firebase Storage
      await ref.putData(imageData);

      // Obtener la URL de descarga
      final url = await ref.getDownloadURL();
      print('File uploaded: $url');
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
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
                        height: 10,
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
                                        crossAxisCount: 6,
                                        crossAxisSpacing: 5,
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
                            Opacity(
                              opacity: 0.0,
                              child: Container(
                                width: MediaQuery.of(context).size.width*1,
                                child: TextFormField(
                                  controller: _correoUsuario,
                                  cursorColor: colorSecundario,
                                  decoration: InputDecoration(
                                    labelText: 'Correo',
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
                          ],
                        ),
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
                                  if(_selectedImagePath!=null){
                                    await _uploadImage(_selectedImagePath!);
                                    try {
                                      await insertarusuarios.saveDatos(
                                        imagen: _selectedImagePath!,
                                        userName: _nombre,
                                        correo: _correoUsuario.text
                                      );

                                      Navigator.push(context, MaterialPageRoute(
                                          builder: (context) => home()));
                                    } catch (error){
                                      print('$error');
                                      print('$_selectedImagePath');
                                    }
                                  }
                                }
                              },
                              child: Text("Continuar",
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
      ),
    );
  }
}
