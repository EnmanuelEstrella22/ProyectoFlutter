import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("AgenRec",style: TextStyle(
            color: Colors.orangeAccent,fontFamily: "Time New Roman"
          ),),
          backgroundColor: Colors.white10,
          elevation: 0,
          bottom: TabBar(
            unselectedLabelColor: Colors.redAccent,
            indicator: BoxDecoration(
              gradient: LinearGradient(colors: [Colors.redAccent,Colors.orangeAccent]),
              borderRadius: BorderRadius.circular(50),
              color: Colors.redAccent
            ),
            tabs: <Widget>[
              Tab( 
                child: Center(
                    child: Text("Eventos"),
                  ),
                ),
                Tab( 
                child: Align(
                  alignment: Alignment.center,
                  child: Icon(Icons.date_range)
                ),
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
            Container(
              child: ListView(
                padding: EdgeInsets.only(top: 20.0),
                children: <Widget>[
                  Center(
                    child: Text("data"),
                  )
                ],
              ),
              
              decoration: BoxDecoration(
                // shape: BoxShape.circle,
                gradient: LinearGradient(colors: [Colors.black12,Colors.transparent,Colors.black12]),
                borderRadius: BorderRadius.only(bottomRight: Radius.circular(50.0),topLeft: Radius.circular(50.0),
                topRight: Radius.circular(50.0),bottomLeft: Radius.circular(50.0)
                )
              ),
              margin: EdgeInsets.only(top: 20.0),
            ),
            Icon(Icons.ac_unit),
            Icon(Icons.ac_unit),
            Icon(Icons.ac_unit),
          ],
        ),
      ),
    );
  }
}