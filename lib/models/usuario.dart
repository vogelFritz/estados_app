class Usuario {
  String nombre;
  int edad;
  List<String> profesiones;

  Usuario({
    required this.nombre,
    this.edad = 0,
    this.profesiones = const [],
  });
}
