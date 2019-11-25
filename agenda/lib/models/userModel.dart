class UserModel {
  int    id;
  String nombre;
  String pass;

  UserModel({this.id, this.nombre,this.pass});

  //Constructor
  UserModel.fromMap(Map<String, dynamic> map){
    id     = map['id'];
    nombre = map['nombre'];
    pass   = map['pass'];
  }

  //Method
  Map<String, dynamic> toMap() {
    return {
      'id'    : id,
      'nombre': nombre,
      'pass'  : pass
    };
  }
}
