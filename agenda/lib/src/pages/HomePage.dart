import 'package:flutter/material.dart';

import 'ListEvent.dart';

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
                  child: Text("Eventos"),
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
            Icon(Icons.ac_unit),
            Icon(Icons.live_help),
            Icon(Icons.ac_unit),
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
    // return Container(
    //   child: SchoolList(),
      // child: Center(
      //   child: ListView(
      //     children: <Widget>[
      //       ListTile(
      //         title: Text('hola'),
      //       ),
            
      //       Text('hola'),
      //       Text('hola'),
      //       Text('hola'),
      //       Text('hola'),
      //       Text('hola'),
      //       Text('hola'),
      //       Text('hola'),
      //       Text('hola'),
      //       Text('hola'),
      //       Text('hola'),
      //       Text('hola'),
      //       Text('hola'),
      //       Text('hola'),
      //       Text('hola'),
      //       Text('hola'),
      //       Text('hola'),
      //       Text('hola'),
      //       Text('hola'),
      //       Text('hola'),
      //       Text('hola'),
      //       Text('hola'),
      //     ],
      //   ),
      // ),
    //   decoration: BoxDecoration(
    //       // shape: BoxShape.circle,
    //       gradient: LinearGradient(
    //           colors: [Colors.black12, Colors.transparent, Colors.black12]),
    //       borderRadius: BorderRadius.only(
    //           topLeft: Radius.circular(50.0), topRight: Radius.circular(50.0))),
    //   margin: EdgeInsets.only(top: 20.0),
    // );
  }
}

// Container(
//               child: ListView(
//                 padding: EdgeInsets.only(top: 20.0),
//                 children: <Widget>[

//                   Center(
//                     child: Row(
//                       children: <Widget>[
//                         FloatingActionButton(

//                           child: Container(

//                             width: double.infinity,
//                             height: double.infinity,
//                             child: Icon(Icons.list),
//                             decoration: BoxDecoration(
//                               gradient: LinearGradient(colors: [Colors.redAccent,Colors.orangeAccent]),
//                               borderRadius: BorderRadius.all(Radius.circular(50.0)),
//                             ),
//                           ),
//                           onPressed: (){},
//                         )

//                       ],
//                     ),
//                   )
//                 ],
//               ),

//               decoration: BoxDecoration(
//                 // shape: BoxShape.circle,
//                 gradient: LinearGradient(colors: [Colors.black12,Colors.transparent,Colors.black12]),
//                 borderRadius: BorderRadius.only(bottomRight: Radius.circular(50.0),topLeft: Radius.circular(50.0),
//                 topRight: Radius.circular(50.0),bottomLeft: Radius.circular(50.0)
//                 )
//               ),
//               margin: EdgeInsets.only(top: 20.0),
//     );
