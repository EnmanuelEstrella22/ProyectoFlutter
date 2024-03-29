import 'dart:math';
import 'package:agenda/models/eventModel.dart';
import 'package:agenda/models/userModel.dart';
import 'package:agenda/providers/db_provider.dart';
import 'package:flutter_auth_buttons/flutter_auth_buttons.dart';

import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  final TextStyle estilo = new TextStyle(fontSize: 20.0);
  final _formKeyLogin = GlobalKey<FormState>();
  final _formKeyRegister = GlobalKey<FormState>();
  final controllerLoginc1 = TextEditingController();
  final controllerLoginc2 = TextEditingController();
  final controllerRegister1 = TextEditingController();
  final controllerRegister2 = TextEditingController();
  final controllerRegister3 = TextEditingController();
  final _formKeyScal = GlobalKey<ScaffoldState>();

  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          _fondoApp(),
          ListView(
            children: <Widget>[
              _formulario(),
              SizedBox(
                height: 200.0,
                width: double.infinity,
              ),
              _formularioRegistro()
            ],
          )
        ],
      ),
    );
  }

  //fondo del login
  Widget _fondoApp() {
    final gradiente = Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(color: Colors.white),
    );

    final caja = Transform.rotate(
      angle: -pi / 5.0,
      child: Container(
        height: 360.0,
        width: 360.0,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(300.0),
            color: Color.fromARGB(150, 245, 117, 22)),
      ),
    );
    final caja1 = Transform.rotate(
      angle: -pi / 5.0,
      child: Container(
        height: 160.0,
        width: 160.0,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: Color.fromARGB(150, 250, 216, 191)),
      ),
    );
    final caja3 = Transform.rotate(
      angle: -pi / 5.0,
      child: Container(
        height: 250.0,
        width: 250.0,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(300.0),
            color: Color.fromARGB(150, 245, 117, 22)),
      ),
    );
    final caja4 = Transform.rotate(
      angle: -pi / 5.0,
      child: Container(
        height: 150.0,
        width: 150.0,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(300.0),
            color: Color.fromARGB(150, 252, 250, 249)),
      ),
    );
    final caja6 = Transform.rotate(
      angle: -pi / 5.0,
      child: Container(
        height: 150.0,
        width: 150.0,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(300.0),
            color: Color.fromARGB(150, 252, 250, 249)),
      ),
    );
    return Stack(
      children: <Widget>[
        gradiente,
        Positioned(
          top: -80.0,
          left: -15.0,
          // right: 10.0,
          child: caja,
        ),
        Positioned(
          top: -40.0,
          right: 150.0,
          child: caja1,
        ),
        Positioned(
          bottom: -70.0,
          left: 180.0,
          child: caja3,
        ),
        Positioned(
          bottom: -35.0,
          left: 175.0,
          child: caja4,
        ),
        Positioned(
          bottom: 100.0,
          left: 260.0,
          child: caja4,
        ),
        Positioned(
          bottom: -50.0,
          left: 300.0,
          child: caja6,
        ),
      ],
    );
  }

  //formulario de inicio de secion
  Widget _formulario() {
    final contenedor = Container(
        margin: EdgeInsets.only(top: 110.0, left: 40.0),
        padding: EdgeInsets.only(right: 10.0, left: 10.0),
        width: 330.0,
        height: 500.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10.0),
              topRight: Radius.circular(50.0),
              bottomLeft: Radius.circular(50.0),
              bottomRight: Radius.circular(10.0)),
          color: Colors.white,
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.black26,
                blurRadius: 3.0,
                offset: Offset(0.2, 0.5),
                spreadRadius: 4.0)
          ],
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.account_circle,
                color: Colors.orange,
                size: 80.0,
              ),
              Text(
                "Iniciar Sesion",
                style: TextStyle(
                    color: Colors.orangeAccent,
                    fontSize: 25.0,
                    fontWeight: FontWeight.normal),
              ),
              Form(
                key: _formKeyLogin,
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 40.0, width: double.infinity),
                    _correoTexto(),
                    SizedBox(height: 20.0, width: double.infinity),
                    _passTexto(),
                    SizedBox(height: 40.0, width: double.infinity),
                    _crearBoton(),
                    SizedBox(height: 10.0, width: double.infinity),
                    _googleBotton(),
                    // SizedBox(width: 100.0),
                    _facebookBotton()
                  ],
                ),
              ),
            ],
          ),
        ));

    return Stack(
      children: <Widget>[
        contenedor,
      ],
    );
  }

  //formulario de registro
  Widget _formularioRegistro() {
    final contenedor = Container(
        margin: EdgeInsets.only(top: 20.0, left: 40.0, bottom: 110.0),
        padding: EdgeInsets.only(right: 10.0, left: 10.0),
        width: 330.0,
        height: 500.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(50.0),
              topRight: Radius.circular(10.0),
              bottomLeft: Radius.circular(10.0),
              bottomRight: Radius.circular(50.0)),
          color: Colors.white,
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.black26,
                blurRadius: 3.0,
                offset: Offset(0.2, 0.5),
                spreadRadius: 4.0)
          ],
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.account_circle,
                color: Colors.orange,
                size: 80.0,
              ),
              Text(
                "Registrarse",
                style: TextStyle(
                    color: Colors.orangeAccent,
                    fontSize: 25.0,
                    fontWeight: FontWeight.normal),
              ),
              Form(
                key: _formKeyRegister,
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 40.0, width: double.infinity),
                    _correoTexto2(),
                    SizedBox(height: 20.0, width: double.infinity),
                    _passTexto2(),
                    SizedBox(height: 20.0, width: double.infinity),
                    _passTextoConfir(),
                    SizedBox(height: 40.0, width: double.infinity),
                    _crearBotonRegis(),
                  ],
                ),
              ),
            ],
          ),
        ));

    return Stack(
      children: <Widget>[contenedor],
    );
  }

  //input Correo
  Widget _correoTexto() {
    return TextFormField(
      controller: controllerLoginc1,
      validator: (value) {
        return value.isEmpty ? 'Campos incorrectos o vacios' : null;
      },
      keyboardType: TextInputType.emailAddress,
      cursorColor: Colors.orangeAccent,
      cursorRadius: Radius.circular(5.0),
      cursorWidth: 3.0,
      decoration: InputDecoration(
        prefixIcon: Icon(
          Icons.account_circle,
          color: Colors.orange,
          size: 35.0,
        ),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
        labelText: 'Correo',
        labelStyle: estilo,
        hintText: 'Escribe aqui',
      ),
    );
  }

  //Input contrasena
  Widget _passTexto() {
    return TextFormField(
      controller: controllerLoginc2,
      validator: (value) {
        return value.isEmpty ? 'Campos incorrectos o vacios' : null;
      },
      cursorColor: Colors.orangeAccent,
      cursorRadius: Radius.circular(5.0),
      cursorWidth: 3.0,
      obscureText: true,
      decoration: InputDecoration(
        prefixIcon: Icon(
          Icons.lock,
          color: Colors.orange,
          size: 35.0,
        ),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
        labelText: 'Contraseña',
        labelStyle: estilo,
        hintText: 'Escribe aqui',
      ),
    );
  }

  //Confirmar clave
  Widget _passTextoConfir() {
    return TextFormField(
      controller: controllerRegister3,
      validator: (value) {
        return value.isEmpty ? 'Campos incorrectos o vacios' : null;
      },
      cursorColor: Colors.orangeAccent,
      cursorRadius: Radius.circular(5.0),
      cursorWidth: 3.0,
      obscureText: true,
      decoration: InputDecoration(
        prefixIcon: Icon(
          Icons.lock,
          color: Colors.orange,
          size: 35.0,
        ),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
        labelText: 'Confirmar Contraseña',
        labelStyle: estilo,
        hintText: 'Escribe aqui',
      ),
    );
  }

  //BOTONES

  //Boton de iniciar secion
  Widget _crearBoton() {
    return RaisedButton(
      padding: EdgeInsets.only(left: 35.0, right: 35.0),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.0),
          side: BorderSide(color: Colors.orangeAccent)),
      onPressed: () {
        if (_formKeyLogin.currentState.validate()) {
          DBProvider.db.searchUserByCorreo(controllerLoginc1.text).then((res) {
            print(res);
            if (res.length == 0) {
              showDialog(
                context: context,
                builder: (_) => AlertDialog(
                      title: Text('Usuario incorrecto'),
                      content: Text("Registrate"),
                      actions: <Widget>[
                        RaisedButton(
                            child: Text(
                              "CERRAR",
                              style: TextStyle(color: Colors.white),
                            ),
                            onPressed: () {
                              Navigator.of(context).pop();
                            })
                      ],
                    ),
                barrierDismissible: true,
              );
            } else {
              if (controllerLoginc1.text == res[0].nombre &&
                  controllerLoginc2.text == res[0].pass) {
                Navigator.pushNamed(context, 'Menu');
              } else {
                showDialog(
                  context: context,
                  builder: (_) => AlertDialog(
                        title: Text('Contraseña incorrecta'),
                        content: Text("Intenta de nuevo"),
                        actions: <Widget>[
                          RaisedButton(
                              child: Text(
                                "CERRAR",
                                style: TextStyle(color: Colors.white),
                              ),
                              onPressed: () {
                                Navigator.of(context).pop();
                              })
                        ],
                      ),
                  barrierDismissible: true,
                );
              }
            }
          });
        }
      },
      color: Colors.white,
      textColor: Colors.orangeAccent,
      child: Text("Iniciar".toUpperCase(), style: TextStyle(fontSize: 20)),
    );
  }

  //Boton Registrarte
  Widget _crearBotonRegis() {
    return RaisedButton(
      padding: EdgeInsets.only(left: 35.0, right: 35.0),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.0),
          side: BorderSide(color: Colors.orangeAccent)),
      onPressed: () {
        if (_formKeyRegister.currentState.validate()) {
          DBProvider.db.addUser(UserModel(
              nombre: controllerRegister1.text,
              pass: controllerRegister2.text));
              Navigator.pushNamed(context, 'Menu');
          controllerRegister1.text = "";
          controllerRegister2.text = "";
          controllerRegister3.text = "";
          showDialog(
            context: context,
            builder: (_) => AlertDialog(
                  title: Text('Usuario Registrado'),
                  actions: <Widget>[
                    RaisedButton(
                        child: Text(
                          "CERRAR",
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                        })
                  ],
                ),
            barrierDismissible: true,
          );
        }
      },
      color: Colors.white,
      textColor: Colors.orangeAccent,
      child: Text("Aceptar".toUpperCase(), style: TextStyle(fontSize: 20)),
    );
  }

  Widget _googleBotton() {
    return GoogleSignInButton(
      onPressed: () {},
      borderRadius: 50.0,
    );
  }

  Widget _facebookBotton() {
    return FacebookSignInButton(
      onPressed: () {}, borderRadius: 50.0,
      //  text: "FACEBOOK",
    );
  }

  Widget _correoTexto2() {
    return TextFormField(
      controller: controllerRegister1,
      validator: (value) {
        return value.isEmpty ? 'Campos incorrectos o vacios' : null;
      },
      keyboardType: TextInputType.emailAddress,
      cursorColor: Colors.orangeAccent,
      cursorRadius: Radius.circular(5.0),
      cursorWidth: 3.0,
      decoration: InputDecoration(
        prefixIcon: Icon(
          Icons.account_circle,
          color: Colors.orange,
          size: 35.0,
        ),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
        labelText: 'Correo',
        labelStyle: estilo,
        hintText: 'Escribe aqui',
      ),
    );
  }

  Widget _passTexto2() {
    return TextFormField(
      controller: controllerRegister2,
      validator: (value) {
        return value.isEmpty ? 'Campos incorrectos o vacios' : null;
      },
      cursorColor: Colors.orangeAccent,
      cursorRadius: Radius.circular(5.0),
      cursorWidth: 3.0,
      obscureText: true,
      decoration: InputDecoration(
        prefixIcon: Icon(
          Icons.lock,
          color: Colors.orange,
          size: 35.0,
        ),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
        labelText: 'Contraseña',
        labelStyle: estilo,
        hintText: 'Escribe aqui',
      ),
    );
  }
}
