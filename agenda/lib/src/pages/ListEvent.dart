import 'package:flutter/material.dart';
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

  final List<Map> schoolLists = [
    {
      "name": "Enmanuel Estrella",
      "location": "15/11/2019",
      "type": "12:00 PM",
      "logoText":
          "https://cdn.pixabay.com/photo/2017/03/16/21/18/logo-2150297_960_720.png"
    },
    {
      "name": "Yoel Nuñez",
      "location": "12/12/2019",
      "type": "2:00 AM",
      "logoText":
          "https://cdn.pixabay.com/photo/2017/01/31/13/14/animal-2023924_960_720.png"
    },
    {
      "name": "Edgar Ariel",
      "location": "22/1/1999",
      "type": "11:23 PM",
      "logoText":
          "https://cdn.pixabay.com/photo/2016/06/09/18/36/logo-1446293_960_720.png"
    },
    {
      "name": "Elian Estrella",
      "location": "03/05/2016",
      "type": "1:30 AM",
      "logoText":
          "https://cdn.pixabay.com/photo/2017/01/13/01/22/rocket-1976107_960_720.png"
    },
    {
      "name": "Elian Estrella",
      "location": "03/05/2016",
      "type": "1:30 AM",
      "logoText":
          "https://cdn.pixabay.com/photo/2017/03/16/21/18/logo-2150297_960_720.png"
    },
    {
      "name": "Elian Estrella",
      "location": "03/05/2016",
      "type": "1:30 AM",
      "logoText":
          "https://cdn.pixabay.com/photo/2017/01/31/13/14/animal-2023924_960_720.png"
    },
    {
      "name": "Elian Estrella",
      "location": "03/05/2016",
      "type": "1:30 AM",
      "logoText":
          "https://cdn.pixabay.com/photo/2016/06/09/18/36/logo-1446293_960_720.png"
    },
    {
      "name": "Campare Handeson",
      "location": "Kasai Pantan NY, 12483",
      "type": "1:30 AM",
      "logoText":
          "https://cdn.pixabay.com/photo/2017/01/13/01/22/rocket-1976107_960_720.png"
    },
  ];

  @override
  Widget build(BuildContext context) {
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
                child: ListView.builder(
                    itemCount: schoolLists.length,
                    itemBuilder: (BuildContext context, int index) {
                      return buildList(context, index);
                    }),
              ),
              //contenedor del menu
              Container(
                margin: EdgeInsets.only(top: 1),
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                     gradient: LinearGradient(
                  colors: [Colors.black12, Colors.orangeAccent]),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30))),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 1),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.menu,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        "Eventos",
                        style: TextStyle(color: Colors.white, fontSize: 24),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.filter_list,
                          color: Colors.white,
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
                          // controller: TextEditingController(text: locations[0]),
                          cursorColor: Theme.of(context).primaryColor,
                          style: dropdownMenuItem,
                          decoration: InputDecoration(
                              hintText: "Search Event",
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
  }

//Listado
  Widget buildList(BuildContext context, int index) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: Colors.white,
      ),
      width: double.infinity,
      height: 110,
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: 50,
            height: 50,
            margin: EdgeInsets.only(right: 15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              border: Border.all(width: 3, color: secondary),
              // image: DecorationImage(
                  // image: CachedNetworkImageProvider(schoolLists[index]['logoText']),
                  // fit: BoxFit.fill),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  schoolLists[index]['name'],
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
                    Text(schoolLists[index]['location'],
                        style: TextStyle(
                            color: primary, fontSize: 13, letterSpacing: .3)),
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
                    Text(schoolLists[index]['type'],
                        style: TextStyle(
                            color: primary, fontSize: 13, letterSpacing: .3)),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}


