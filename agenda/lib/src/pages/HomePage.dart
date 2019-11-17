import 'package:agenda/src/pages/Ajustes.dart';
import 'package:agenda/src/pages/Calendario.dart';
import 'package:flutter/material.dart';

import 'ListEvent.dart';
import 'Perfil.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "AgenRec",
            style: TextStyle(
                color: Colors.orangeAccent, fontFamily: "Time New Roman"),
          ),
          backgroundColor: Colors.white10,
          elevation: 0,
          bottom: TabBar(
            unselectedLabelColor: Colors.redAccent,
            indicator: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.redAccent, Colors.orangeAccent]),
                borderRadius: BorderRadius.circular(50),
                color: Colors.redAccent),
            tabs: <Widget>[
              Tab(
                child: Center(
                  child: Text(
                    "Eventos",
                    style: TextStyle(fontStyle: FontStyle.italic),
                  ),
                ),
              ),
              Tab(
                child: Align(
                    alignment: Alignment.center, child: Icon(Icons.date_range)),
              ),
              Tab(
                child: Align(
                  alignment: Alignment.center,
                  child: Icon(Icons.settings),
                ),
              ),
              Tab(
                child: Align(
                  alignment: Alignment.center,
                  child: Icon(Icons.account_circle),
                ),
              )
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            eventos(context),
            llamarCalendario(),
            llamarAjustes(),
            ProfileFivePage()
          ],
        ),
      ),
    );
  }

  Widget eventos(BuildContext context) {
    return Scaffold(
        body: contenido(),
        floatingActionButton: FloatingActionButton(
          child: Container(
            width: double.infinity,
            height: double.infinity,
            child: Icon(Icons.add_to_photos),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.redAccent, Colors.orangeAccent]),
              borderRadius: BorderRadius.all(Radius.circular(50.0)),
            ),
          ),
          onPressed: () {
            Navigator.pushNamed(context, 'FormEvent');
          },
        ));
  }

  Widget contenido() {
    return SchoolList();
  }

  Widget llamarCalendario() {
    return Container(child: CalendarPage2());
  }

  Widget llamarAjustes() {
    return Ajustes();
  }
}
