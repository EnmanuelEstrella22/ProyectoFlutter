import 'package:flutter/material.dart';


class Ajustes extends StatelessWidget {

  final _menulist = [
    {'label': 'Ajustes de Sonido', 'ruta': 'CreateUser', 'iconos': 'person_add'},
    {
      'label': 'Notificaciones','iconos': 'refresh'
    },
    {'label': 'Contactos', 'iconos': 'list'},
    {
      'label': 'Ayuda','iconos': 'delete'
    },
    {'label': 'Acerca de', 'iconos': 'loop'}
  ];

  final _iconos = <String, IconData>{
    'person_add': Icons.surround_sound,
    'refresh': Icons.notifications,
    'list': Icons.contacts,
    'delete': Icons.delete,
    'loop': Icons.loop
  };


  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: _drawerItems(context)),
    );
  }

  _drawerItems(BuildContext context) {
    List<Widget> list = List<Widget>();
    
    for (Map it in _menulist) {
      //print(it);
      list
        ..add(itemMenu(it, context))
        ..add(Divider(
          thickness: 1.4,
        ));
    }

    return list;
  }

   Widget itemMenu(Map it, context) {
    // print(it['iconos']);
    return ListTile(
      title: Text(it['label'],
          style: TextStyle(fontSize: 22.0, color: Colors.black),
          textAlign: TextAlign.left),
          
      leading: getIcon(it['iconos']),
      trailing: Icon(Icons.arrow_forward_ios,color: Color.fromRGBO(255, 69, 0, 1.0),),
      onTap: () {
        Navigator.pushNamed(context, it['ruta']);
      },
    );
  }

  Icon getIcon(String nombre) {
    // print(nombre);
    return Icon(_iconos[nombre], color: Color.fromRGBO(255, 69, 0, 1.0));
  }
  
}