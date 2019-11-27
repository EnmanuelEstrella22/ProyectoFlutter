import 'package:agenda/models/eventModel.dart';
import 'package:agenda/providers/db_provider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Eventos extends StatefulWidget {
  @override
  _EventosState createState() => _EventosState();
}

//final _formKey = GlobalKey<FormState>();
final usernameControllerHora = TextEditingController();
final usernameControllerNombre = TextEditingController();
final usernameControllerDesp = TextEditingController();
final usernameControllerTime = TextEditingController();
final TextStyle estilo = new TextStyle(fontSize: 20.0);
final _formKey = GlobalKey<FormState>();
String _fecha = '';
String _alert = '';

var _datos = ['muy importante', 'solo recordar'];
// var _valorSel ='Evento';

class _EventosState extends State<Eventos> {
  String _valorSel;
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      //floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
      floatingActionButton: floatb(),
      body: Stack(
        children: <Widget>[
          
          _crearfondo(context),
          _formulario(context),
          
        ],
      ),
    );
  }

  Widget _cajaTexto() {
    return TextFormField(
      //key: _formKey,
      validator: (value) {
        return value.isEmpty ? 'El evento debe de llevar un nombre' : null;
      },
      controller: usernameControllerNombre,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
        labelText: 'Nombre del Evento',
        labelStyle: estilo,
        hintText: 'Escribe aqui',
        icon: Icon(
          Icons.event_note,
          color: Colors.orange,
        ),
      ),
    );
  }

  Widget _crearDate(BuildContext context) {
    return TextField(
      controller: usernameControllerHora,
      enableInteractiveSelection: false,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
        labelText: 'Fecha del evento',
        labelStyle: estilo,
        hintText: 'Escribe aqui',
        icon: Icon(Icons.calendar_today, color: Colors.orange),

        // focusColor: Colors.orange
      ),
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
        _selectDate(context);
      },
    );
  }

  _selectDate(BuildContext context) async {
    DateTime picked = await showDatePicker(
        context: context,
        initialDate: new DateTime.now(),
        firstDate: new DateTime(2018),
        lastDate: new DateTime(2025),
        locale: Locale('es', 'ES'));

    if (picked != null) {
      setState(() {
        DateFormat format = new DateFormat("dd/MM/yyyy");
        _fecha = format.format(picked);
        usernameControllerHora.text = _fecha;
      });
    }
  }

  Widget _crearTextHora() {
    return TextField(
      //autofocus: true,
      controller: usernameControllerTime,
      enableInteractiveSelection: false,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
        labelText: 'Hora del Evento',
        labelStyle: estilo,
        hintText: 'Escribe aqui',
        icon: Icon(
          Icons.alarm,
          color: Colors.orange,
        ),
      ),
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
        _selectHora(context);
      },
    );
  }

  _selectHora(BuildContext context) async {
    TimeOfDay selectedTime = await showTimePicker(
     initialTime: TimeOfDay.fromDateTime(DateTime.now()),
      context: context,
    );
    if (selectedTime != null) {
      setState(() {
        usernameControllerTime.text=selectedTime.format(context);
        //  selectedTime.hour.toString() +
        //     selectedTime.minute.toString() +
        //     selectedTime.hourOfPeriod.toString();
      });
    }
  }

  Widget _cajaDesc() {
    return TextFormField(
      // validator: (value) {
      //           return value.isEmpty
      //               ? 'Ningun apunte'
      //               : null;
      //         },
      //autofocus: true,
      controller: usernameControllerDesp,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
        labelText: 'Descripcion',
        labelStyle: estilo,
        hintText: 'Escribe aqui',
        icon: Icon(
          Icons.description,
          color: Colors.orange,
        ),
      ),
      maxLines: 6,
    );
  }

  Widget _selector() {
    return DropdownButton<String>(
      items: _datos.map((String dropDownStringItem) {
        return DropdownMenuItem<String>(
          value: dropDownStringItem,
          child: Text(dropDownStringItem),
        );
      }).toList(),
      onChanged: (String valorSeleccionado) {
        setState(() {
          this._valorSel = valorSeleccionado;
        });
      },
      value: _valorSel,
    );
  }

  Widget _crearfondo(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final fondo_master = Container(
      height: size.height * 0.4,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient:
            LinearGradient(colors: [Colors.redAccent, Colors.orangeAccent]),
      ),
    );

    return Stack(
      children: <Widget>[
        fondo_master,
        Container(
            child: Column(
          children: <Widget>[
            SizedBox(
              height: 90.0,
              width: double.infinity,
            ),
            Text(
              'Nuevo Evento',
              style: TextStyle(color: Colors.white, fontSize: 30.0),
            ),
          ],
        ))
      ],
    );
  }

  Widget _formulario(BuildContext context) {
    final sizes = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SafeArea(
              child: Container(
            height: 110.0,
          )),
          Container(
            padding: EdgeInsets.symmetric(vertical: 65.0, horizontal: 15.0),
            width: sizes.width * 0.85,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15)),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                      color: Colors.black,
                      blurRadius: 3.0,
                      offset: Offset(0.2, 0.5),
                      spreadRadius: 3.0)
                ]),
            child: Column(
              children: <Widget>[
                Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      Text(_alert),
                      _cajaTexto(),
                      Divider(),
                      _crearDate(context),
                      Divider(),
                      _crearTextHora(),
                      Divider(),
                      _cajaDesc(),
                      Divider(),
                    ],
                  ),
                ),
                Row(
                  children: <Widget>[
                    Text(
                      'Tipo',
                      style: estilo,
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 20),
                    ),
                    _selector(),
                  ],
                ),
                Divider(),
                crearBoton()
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget crearBoton() {
    return RaisedButton(
      child: Text(
        'Agregar Evento',
        style: TextStyle(color: Colors.white),
      ),
      color: Color.fromRGBO(255, 69, 0, 1.0),
      onPressed: () {
        if (_formKey.currentState.validate()) {
          DBProvider.db
                  .addEvento(EventModel(nombre: usernameControllerNombre.text,fecha: usernameControllerHora.text,
                  hora: usernameControllerTime.text,descripcion: usernameControllerDesp.text,
                  tipo: _valorSel.toString()));
                  final snackBar = SnackBar(
                    duration: Duration(milliseconds: 1200),
                    content: Text(
                        'El usuario ${usernameControllerNombre.text} ha sido guardado'),
                    action: SnackBarAction(
                      label: 'Undo',
                      onPressed: () {
                        cleanText();
                        // Some code to undo the change.
                      },
                    ),
                  );
                  Scaffold.of(context).showSnackBar(snackBar);
                  _formKey.currentState?.reset(); 
                      
        }

                  cleanText();
              },
            );
          }
        
          Widget floatb() {
            return FloatingActionButton(
              child: Container(
                width: double.infinity,
                height: double.infinity,
                child: Icon(Icons.arrow_back),
                decoration: BoxDecoration(
                  gradient:
                      LinearGradient(colors: [Colors.redAccent, Colors.orangeAccent]),
                  borderRadius: BorderRadius.all(Radius.circular(50.0)),
                ),
              ),
              onPressed: () {
                Navigator.pop(context);
                cleanText();
              },
            );
          }
        
          void cleanText() {
            usernameControllerDesp.clear();
            usernameControllerNombre.clear();
            usernameControllerHora.clear();
            usernameControllerTime.clear();
          
          }
}
