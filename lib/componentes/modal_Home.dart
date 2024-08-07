import 'package:flutter/material.dart';
import 'package:getfunds/colores.dart';
import 'package:getfunds/insertar/insertarHome.dart';
import 'package:getfunds/vistas/home.dart';
import 'package:intl/intl.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Modal_Home extends StatefulWidget {
  @override
  _Modal_HomeState createState() => _Modal_HomeState();

  void mainBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return _ModalContent();
      },
    );
  }
}

class _Modal_HomeState extends State<Modal_Home> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class _ModalContent extends StatefulWidget {
  @override
  __ModalContentState createState() => __ModalContentState();
}

class __ModalContentState extends State<_ModalContent> {
  final InsertarDatos insertarDatos = InsertarDatos();
  final frm = GlobalKey<FormState>();
  late TextEditingController _correoUsuario;

  @override
  void initState() {
    super.initState();
    _correoUsuario = TextEditingController();
    _getUserEmail();
  }

  /* Controladores */
  late String _Categoria;
  late String _Tipo;
  late int _Valor;
  late DateTime _Fecha;

  TextEditingController _dateController = TextEditingController();
  DateTime? _selectedDate;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: ColorScheme.light(
              primary: Colors.green,
              onPrimary: Colors.white,
            ),
            dialogBackgroundColor: colorSecundario,
          ),
          child: child!,
        );
      },
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        _dateController.text = DateFormat('yyyy-MM-dd').format(picked);
      });
    }
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

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 0),
      padding: EdgeInsets.all(30.0),
      height: 500,
      width: MediaQuery.of(context).size.width * 1,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              child: Text(
                'Agregar Registro',
                style: TextStyle(
                  color: colorSecundario,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
          ),
          Form(
            key: frm,
            child: Column(
              children: [
                TextFormField(
                  controller: _dateController,
                  keyboardType: TextInputType.none,
                  decoration: InputDecoration(
                    labelText: 'Fecha',
                    labelStyle: TextStyle(),
                    prefixIcon: Icon(
                      Icons.calendar_month,
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
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Ingrese la Fecha';
                    } else {
                      return null;
                    }
                  },
                  onTap: () {
                    FocusScope.of(context).requestFocus(new FocusNode());
                    _selectDate(context);
                  },
                  onSaved: (value) {
                    if (_selectedDate != null) {
                      _Fecha = _selectedDate!;
                    }
                  },
                ),
                SizedBox(height: 10),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Ingresa la Categoria',
                    labelStyle: TextStyle(),
                    prefixIcon: Icon(
                      Icons.category,
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
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Ingrese la Categoria.';
                    } else {
                      return null;
                    }
                  },
                  onSaved: (value) {
                    _Categoria = value!;
                  },
                ),
                SizedBox(height: 10),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Ingresa el Tipo',
                    labelStyle: TextStyle(),
                    prefixIcon: Icon(
                      Icons.merge_type,
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
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Ingrese el Tipo.';
                    } else {
                      return null;
                    }
                  },
                  onSaved: (value) {
                    _Tipo = value!;
                  },
                ),
                SizedBox(height: 10),
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Ingresa el Valor',
                    labelStyle: TextStyle(),
                    prefixIcon: Icon(
                      Icons.monetization_on,
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
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Ingrese el Valor.';
                    } else {
                      return null;
                    }
                  },
                  onSaved: (value) {
                    _Valor = int.parse(value!);
                  },
                ),
                Opacity(
                  opacity: 0.0,
                  child: Container(
                    width: MediaQuery.of(context).size.width*1,
                    height: 10,
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
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      if (frm.currentState!.validate()) {
                        frm.currentState!.save();
                        insertarDatos.saveDatos(
                          categoria: _Categoria,
                          tipo: _Tipo,
                          valor: _Valor,
                          fecha: _Fecha,
                          correo: _correoUsuario.text,
                        );
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>home()));
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: colorPrincipal,
                    ),
                    child: Text(
                      'Registrar',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
