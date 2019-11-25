class EventModel {
  int    id;
  String nombre;
  String fecha;
  String hora;
  String descripcion;
  String tipo;

  EventModel({this.id, this.nombre,this.fecha,this.hora,this.descripcion,this.tipo});

  //Constructor
  EventModel.fromMap(Map<String, dynamic> map){
    id          = map['id'];
    nombre      = map['nombre'];
    fecha       = map['fecha'];
    hora        = map['hora'];
    descripcion = map['descripcion'];
    tipo        = map['tipo'];
  }

  //Method
  Map<String, dynamic> toMap() {
    return {
      'id'          : id,
      'nombre'      : nombre,
      'fecha'       : fecha,
      'hora'        : hora,
      'descripcion' : descripcion,
      'tipo'        : tipo
    };
  }
}
