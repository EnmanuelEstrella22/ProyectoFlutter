import 'package:agenda/models/eventModel.dart';
import 'package:agenda/providers/db_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/basic.dart';
import 'package:flutter/src/widgets/container.dart';

import 'form/add_event.dart';
// import 'package:cached_network_image/cached_network_image.dart';

class SchoolList extends StatefulWidget {
  SchoolList({Key key}) : super(key: key);
  static final String path = "lib/src/pages/lists/list2.dart";

  _SchoolListState createState() => _SchoolListState();
}

class _SchoolListState extends State<SchoolList> {
  final TextStyle dropdownMenuItem =
      TextStyle(color: Colors.black, fontSize: 18);

  final primary = Color(0xff696b9e);
  final secondary = Color(0xfff29a94);

  final _editingController22 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<EventModel>>(
      future: DBProvider.db.buquedaEvent(_editingController22.text),
      builder:
          (BuildContext context, AsyncSnapshot<List<EventModel>> snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if (snapshot.hasData == null) {
          return Center(
            child: Text(
              'No hay usuarios registrados',
              style: TextStyle(fontSize: 28.0, color: Colors.red),
            ),
          );
        }
        return Scaffold(
          backgroundColor: Color(0xfff0f0f0),
          body: SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Stack(
                children: <Widget>[
                  //contenedor de la lista
                  Container(
                      padding: EdgeInsets.only(top: 105),
                      height: MediaQuery.of(context).size.height,
                      width: double.infinity,
                      child: ListView(
                        children: buildList(context, snapshot.data),
                      )),
                  //contenedor del menu
                  Container(
                    margin: EdgeInsets.only(top: 1),
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [Colors.black12, Colors.black12]),
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(30),
                            bottomRight: Radius.circular(30))),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 1),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          IconButton(
                            onPressed: () {
                              showCupertinoModalPopup(
                                context: context,
                                builder: (BuildContext context) =>
                                    CupertinoActionSheet(
                                        title: const Text('Escoger Opciones',
                                            style: TextStyle(
                                                fontStyle: FontStyle.italic)),
                                        message: const Text('Ordenar Por:',
                                            style: TextStyle(
                                                fontStyle: FontStyle.italic)),
                                        actions: <Widget>[
                                          CupertinoActionSheetAction(
                                            child: const Text('FECHA'),
                                            onPressed: () {
                                              // Navigator.pop(context, 'One');
                                            },
                                          ),
                                          CupertinoActionSheetAction(
                                            child: const Text('TIPO'),
                                            onPressed: () {
                                              // Navigator.pop(context, 'Two');
                                            },
                                          )
                                        ],
                                        cancelButton:
                                            CupertinoActionSheetAction(
                                          child: const Text('Cancelar',
                                              style: TextStyle(
                                                  fontStyle: FontStyle.italic)),
                                          isDefaultAction: true,
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                        )),
                              );
                            },
                            icon: Icon(
                              Icons.menu,
                              color: Colors.white,
                              size: 30.0,
                            ),
                          ),
                          Text(
                            "TODOS",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 28,
                                fontStyle: FontStyle.italic),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.filter_list,
                              color: Colors.transparent,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  //contenedor de la busqueda
                  Container(
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 46,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Material(
                            elevation: 5.0,
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            child: TextField(
                              controller: _editingController22,
                              cursorColor: Theme.of(context).primaryColor,
                              style: dropdownMenuItem,
                              decoration: InputDecoration(
                                  hintText: "Buscar Evento",
                                  hintStyle: TextStyle(
                                      color: Colors.black38, fontSize: 16),
                                  prefixIcon: Material(
                                    elevation: 0.0,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(30)),
                                    child: Icon(Icons.search),
                                  ),
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.symmetric(
                                      horizontal: 25, vertical: 13)),
                              onEditingComplete: () {
                                setState(() {
                                  _editingController22.text;
                                });
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }

//Listado
  List<Widget> buildList(BuildContext context, List<EventModel> event) {
    return event.map((events) {
      var name = events.nombre;
      return Dismissible(
        key: UniqueKey(),
        background: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            gradient:
                LinearGradient(colors: [Colors.redAccent, Colors.orangeAccent]),
          ),
          child: Row(
            mainAxisAlignment:MainAxisAlignment.spaceBetween ,
           
            children: <Widget>[
              Icon(Icons.delete_forever,size: 50.0,color: Colors.white),
              Text(
                '$name',
                textAlign: TextAlign.right,
                style: TextStyle(color: Colors.white, fontSize: 22.0),
              ),
              Icon(Icons.delete_forever,size: 50.0,color: Colors.white),
            ],
          ),
        ),
        onDismissed: (direction) {
          DBProvider.db.deleteEventById(events.id);
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: Colors.white,
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Colors.black26,
                  blurRadius: 3.0,
                  offset: Offset(0.2, 0.5),
                  spreadRadius: 4.0)
            ],
          ),
          width: double.infinity,
          height: 110,
          margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // Container(
              //   width: 50,
              //   height: 50,
              //   margin: EdgeInsets.only(right: 15),
              //   decoration: BoxDecoration(
              //     borderRadius: BorderRadius.circular(50),
              //     border: Border.all(width: 3, color: secondary),
              //     // image: DecorationImage(
              //     // image: CachedNetworkImageProvider(schoolLists[index]['logoText']),
              //     // fit: BoxFit.fill),
              //   ),
              //   //colocar algo
              // ),
               SizedBox(
                      width: 10,
                    ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      events.nombre,
                      style: TextStyle(
                          color: primary,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Row(
                      children: <Widget>[
                        Icon(
                          Icons.calendar_today,
                          color: secondary,
                          size: 20,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(events.fecha,
                            style: TextStyle(
                                color: primary,
                                fontSize: 13,
                                letterSpacing: .3)),
                      ],
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Row(
                      children: <Widget>[
                        Icon(
                          Icons.timer,
                          color: secondary,
                          size: 20,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(events.hora,
                            style: TextStyle(
                                color: primary,
                                fontSize: 13,
                                letterSpacing: .3)),
                      ],
                    ),
                  ],
                ),
              ),
              Center(
                child: Container(
                  decoration: BoxDecoration(
                      // borderRadius: BorderRadius.all(Radius.circular(50.0)),
                      shape: BoxShape.circle,
                      border:  Border.all(
                        color: Colors.black12,
                        width: 2.5,
                      )),
                  // color: Colors.black,
                  child: IconButton(
                      icon: Icon(Icons.edit, color: Colors.orangeAccent),
                      onPressed: () {
                        Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Eventos(id: events.id,nombre: events.nombre,fecha: events.fecha,hora: events.hora,descripcion: events.descripcion,tipo: events.tipo)), //AQUÍ ESTA EL ERROR AL PASAR EL ARGUMENTO
                );
                      }),
                ),
              ),
            ],
          ),
        ),
      );
    }).toList();
  }
}
