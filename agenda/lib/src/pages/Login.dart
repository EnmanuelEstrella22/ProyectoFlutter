import 'dart:math';

import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override

  final TextStyle estilo = new TextStyle(fontSize: 20.0);

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

 Widget  _fondoApp() {

   final gradiente = Container(
     width: double.infinity,
     height: double.infinity,
     decoration: BoxDecoration(
       color: Colors.white 
     ),
   );

   final caja = Transform.rotate(
     angle: -pi / 5.0,
     child:Container(
       height: 360.0,
       width: 360.0,
       decoration: BoxDecoration(
         borderRadius: BorderRadius.circular(300.0),
        color: Color.fromARGB(150, 245, 117, 22 )
       ),
     ),
   );
   final caja1 = Transform.rotate(
     angle: -pi / 5.0,
     child:Container(
       height: 160.0,
       width: 160.0,
       decoration: BoxDecoration(
         borderRadius: BorderRadius.circular(10.0),
         color: Color.fromARGB(150,250, 216, 191 )         
       ),
     ),
   );
   final caja3 = Transform.rotate(
     angle: -pi / 5.0,
     child:Container(
       height: 250.0,
       width: 250.0,
       decoration: BoxDecoration(
         borderRadius: BorderRadius.circular(300.0),
        color: Color.fromARGB(150, 245, 117, 22 )
       ),
     ),
   );    
   final caja4 = Transform.rotate(
     angle: -pi / 5.0,
     child:Container(
       height: 150.0,
       width: 150.0,
       decoration: BoxDecoration(
         borderRadius: BorderRadius.circular(300.0),
        color: Color.fromARGB(150, 252, 250, 249)
       ),
     ),
   );       
   final caja6 = Transform.rotate(
     angle: -pi / 5.0,
     child:Container(
       height: 150.0,
       width: 150.0,
       decoration: BoxDecoration(
         borderRadius: BorderRadius.circular(300.0),
        color: Color.fromARGB(150, 252, 250, 249)
       ),
     ),
   );      
   return Stack(
     children: <Widget>[
       gradiente,
       Positioned(
         top: -130.0,
         child: caja,
       ),
       Positioned(
         top: -40.0,
         right: 100.0,
         child: caja1,
       ),
       Positioned(
         bottom: -100.0,
         left: 150.0,
         child: caja3,
       ),
       Positioned(
         bottom: -30.0,
         left: 130.0,
         child: caja4,
       ),
       Positioned(
         bottom: -50.0,
         left: 250.0,
         child: caja6,
       ),
     ],
   );
 }

 Widget _formulario() {

   final contenedor = Container(
     margin: EdgeInsets.only(top: 20.0,left: 30.0),
     width: 300.0,
     height: 500.0,
     decoration: BoxDecoration(
       borderRadius: BorderRadius.only(topLeft: Radius.circular(10.0),
       topRight: Radius.circular(50.0),bottomLeft: Radius.circular(50.0),
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
     child: Column(
       crossAxisAlignment: CrossAxisAlignment.center,
       children: <Widget>[
         Icon(
           Icons.account_circle,
           color: Colors.orange,
           size: 80.0,
         ),
         Text("LOGIN",style: TextStyle(color: Colors.orangeAccent,fontSize: 25.0, fontWeight: FontWeight.normal),),
          SizedBox(height: 40.0,width: double.infinity),
         _correoTexto(),
          SizedBox(height: 20.0,width: double.infinity),
         _passTexto(),
          SizedBox(height: 40.0,width: double.infinity),
         crearBoton()


       ],
     ),
   );

   return Stack(
     children: <Widget>[
       contenedor,
     ],
   );
 }

  Widget _formularioRegistro() {

   final contenedor = Container(
     margin: EdgeInsets.only(bottom: 30.0,left: 30.0),
     width: 300.0,
     height: 500.0,
     decoration: BoxDecoration(
       borderRadius: BorderRadius.only(topLeft: Radius.circular(10.0),
       topRight: Radius.circular(50.0),bottomLeft: Radius.circular(50.0),
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
   );

   return Stack(
     children: <Widget>[
       contenedor
     ],
   );
 }

  Widget _correoTexto() {
  return TextField(
    //autofocus: true,
    textCapitalization: TextCapitalization.characters,
    decoration: InputDecoration(
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
      labelText: 'Correo',
      labelStyle: estilo,
      hintText: 'Escribe aqui',
      icon: Icon(
        Icons.account_circle,
        color: Colors.orange,
        size: 35.0,
      ),
    ),
  );
 }
 Widget _passTexto() {
  return TextField(
    //autofocus: true,
    textCapitalization: TextCapitalization.characters,
    decoration: InputDecoration(
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
      labelText: 'Contraseña',
      labelStyle: estilo,
      hintText: 'Escribe aqui',
      icon: Icon(
        Icons.lock,
        color: Colors.orange,
        size: 35.0,
      ),
    ),
  );
  }
  
  Widget crearBoton() {
    return RaisedButton(
      child: Text(
        'Agregar Evento',
        style: TextStyle(color: Colors.white),
      ),
      color: Colors.orangeAccent,
      onPressed: (
      ) {},
    );
  }
}
