import 'package:flutter/material.dart';
// import 'package:flutter_ui_challenges/core/presentation/res/assets.dart';
// import 'package:flutter_ui_challenges/src/widgets/network_image.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
class ProfileFivePage extends StatelessWidget {

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: _perfil()

    );
  }

Widget  _perfil() {
  return Stack(
        children: <Widget>[
          //contenedor principal
          Container(
            margin: EdgeInsets.only(top: 5.0),
            height: 345,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50.0), bottomRight: Radius.circular(50.0)),
              gradient: LinearGradient(
                colors: [Colors.red[200],Colors.orange[300]],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight
              )
            ),
          ),
          Container(
            alignment: Alignment.topRight,
            child: IconButton(
              icon: Icon(Icons.notifications,color: Colors.white,),
              onPressed: (){},
            ),
          ),
          //perfil,imagen,nombre,lugrar
          Container(
            margin: const EdgeInsets.only(top: 80),
            child: Column(
              children: <Widget>[
                Text("Perfil", style: TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontStyle: FontStyle.italic
                ),),
                SizedBox(height: 20.0),
                Expanded(
                  child: Stack(
                    children: <Widget>[
                      Container(
                        alignment:Alignment.center,
                        height: double.infinity,
                        width: 200.0,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(30.0),
                          child: Image.asset("images/manuelito.jpeg",fit: BoxFit.cover),
                        )
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10.0),
                Text("Enmanuel - 22", style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0
                ),),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.location_on, size: 16.0, color: Colors.grey,),
                    Text("Laguna Prieta, Santiago, RD", style: TextStyle(color: Colors.grey.shade600),)
                  ],
                ),
                SizedBox(height: 5.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    
                    IconButton(
                      color: Colors.grey,
                      icon: Icon(FontAwesomeIcons.instagram),
                      onPressed: (){},
                    ),
                    IconButton(
                      color: Colors.grey,
                      icon: Icon(FontAwesomeIcons.facebookF),
                      onPressed: (){},
                    ),
                    IconButton(
                      color: Colors.grey.shade600,
                      icon: Icon(FontAwesomeIcons.twitter),
                      onPressed: (){},
                    ),
                  ],
                ),
                SizedBox(height: 10.0),
                Container(
                  child: Stack(
                    children: <Widget>[
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 16.0),
                        margin: const EdgeInsets.only(top: 30 ,left: 20.0, right: 20.0,bottom: 20.0),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [Colors.red[200],Colors.orange[300]],
                          ),
                          borderRadius: BorderRadius.circular(30.0)
                        ),
                        child: Row(
                          children: <Widget>[
                            IconButton(
                              color: Colors.white,
                              icon: Icon(FontAwesomeIcons.user),
                              onPressed: (){},
                            ),
                            IconButton(
                              color: Colors.white,
                              icon: Icon(Icons.location_on),
                              onPressed: (){},
                            ),
                            Spacer(),
                            IconButton(
                              color: Colors.white,
                              icon: Icon(Icons.add),
                              onPressed: (){},
                            ),
                            IconButton(
                              color: Colors.white,
                              icon: Icon(Icons.message),
                              onPressed: (){},
                            ),
                          ],
                        ),
                      ),
                      Center(
                        child: FloatingActionButton(
                          child: Icon(Icons.favorite, color: Colors.pink,),
                          backgroundColor: Colors.white,
                          onPressed: (){},
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),

          // AppBar(
            // backgroundColor: Colors.transparent,
            // elevation: 0,
            // actions: <Widget>[
            //   IconButton(
            //     icon: Icon(Icons.notifications),
            //     onPressed: (){},
            //   ),
            // ],
          // ),
        ],
      );
}
}