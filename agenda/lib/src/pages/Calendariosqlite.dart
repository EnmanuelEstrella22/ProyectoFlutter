import 'package:agenda/models/eventModel.dart';
import 'package:agenda/models/userModel.dart';
import 'package:agenda/providers/db_provider.dart';
import 'package:agenda/src/pages/Calendario.dart' as prefix0;
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart'
    show CalendarCarousel;
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/classes/event_list.dart';

class CalendarPage3 extends StatefulWidget {
  @override
  _CalendarPage2State createState() => new _CalendarPage2State();
}

//solo recordar
List<DateTime> presentDates = [];

//importantes
List<DateTime> absentDates = [];

class _CalendarPage2State extends State<CalendarPage3> {
  DateTime _currentDate2 = DateTime.now();
  static Widget _presentIcon(String day) => Container(
        decoration: BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.all(
            Radius.circular(1000),
          ),
        ),
        child: Center(
          child: Text(
            day,
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
      );
  static Widget _absentIcon(String day) => Container(
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.all(
            Radius.circular(1000),
          ),
        ),
        child: Center(
          child: Text(
            day,
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
      );

  EventList<Event> _markedDateMap = new EventList<Event>(
    events: {},
  );

  CalendarCarousel _calendarCarouselNoHeader;

  //var len = 9;
  double cHeight;

  @override
  Widget build(BuildContext context) {
    cHeight = MediaQuery.of(context).size.height;
    return FutureBuilder<List<EventModel>>(
      future: DBProvider.db.listaEvento(),
      builder:
          (BuildContext context, AsyncSnapshot<List<EventModel>> snapshot) {
        if (snapshot.data.length == 0) {
          return Center(
            child: Text(
              'No Hay Eventos Creados',
              style: TextStyle(fontSize: 28.0, color: Colors.red),
            ),
          );
        }
        

        

        agregadatos(context, snapshot.data);
        agregadatos2(context, snapshot.data);

        for (int i = 0; i < presentDates.length; i++) {
          _markedDateMap.add(
            presentDates[i],
            new Event(
              date: presentDates[i],
              title: 'Event 5',
              icon: _presentIcon(
                presentDates[i].day.toString(),
              ),
            ),
          );
        }

        for (int i = 0; i < absentDates.length; i++) {
          _markedDateMap.add(
            absentDates[i],
            new Event(
              date: absentDates[i],
              title: 'Event 5',
              icon: _absentIcon(
                absentDates[i].day.toString(),
              ),
            ),
          );
        }

        _calendarCarouselNoHeader = CalendarCarousel<Event>(
          height: cHeight * 0.54,
          weekendTextStyle: TextStyle(
            color: Colors.red,
          ),
          todayButtonColor: Colors.blue[200],
          markedDatesMap: _markedDateMap,
          markedDateShowIcon: true,
          markedDateIconMaxShown: 1,
          markedDateMoreShowTotal:
              null, // null for not showing hidden events indicator
          markedDateIconBuilder: (event) {
            return event.icon;
          },
        );

        return SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              _calendarCarouselNoHeader,
              markerRepresent(Colors.red, "Importantes"),
              markerRepresent(Colors.green, "Solo Recordar"),
            ],
          ),
        );
      },
    );
  }

  Widget markerRepresent(Color color, String data) {
    return new ListTile(
      leading: new CircleAvatar(
        backgroundColor: color,
        radius: cHeight * 0.022,
      ),
      title: new Text(
        data,
      ),
    );
  }

  List agregadatos(BuildContext context, List<EventModel> users) {
    return users.map((user) {
     // print(user.fecha);
      try {
        int dia = 0;
        int mes = 0;
        int ano = 0;
        if (user.tipo == 'muy importante') {
          dia = int.parse(user.fecha.split("/")[0]);
          mes = int.parse(user.fecha.split("/")[1]);
          ano = int.parse(user.fecha.split("/")[2]);
        }
        //print(DateTime(ano, mes, dia));
        return absentDates.add(DateTime(ano, mes, dia));
      } catch (err) {
        print('jhjh');
      }
    }).toList();
  }

  List agregadatos2(BuildContext context, List<EventModel> users) {
    return users.map((user) {
      //print(user.fecha);
      try {
        int dia = 0;
        int mes = 0;
        int ano = 0;
        if (user.tipo == 'solo recordar') {
          dia = int.parse(user.fecha.split("/")[0]);
          mes = int.parse(user.fecha.split("/")[1]);
          ano = int.parse(user.fecha.split("/")[2]);
        }
        print(DateTime(ano, mes, dia));
        return presentDates.add(DateTime(ano, mes, dia));
      } catch (err) {
        print('jhjh');
      }
    }).toList();
  }
}
