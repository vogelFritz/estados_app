import 'dart:async';

import 'package:estados_app/models/usuario.dart';

class _UsuarioService {
  Usuario? _usuario;

  final StreamController<Usuario> _usuarioStreamController =
      StreamController<Usuario>.broadcast();

  Usuario? get usuario => _usuario;

  Stream<Usuario> get usuarioStream => _usuarioStreamController.stream;

  bool get existeUsuario => _usuario != null;

  void cargarUsuario(Usuario u) {
    _usuario = u;
    _usuarioStreamController.add(u);
  }

  void cambiarEdad(int edad) {
    if (_usuario != null) {
      _usuario!.edad = edad;
      _usuarioStreamController.add(_usuario!);
    }
  }

  void dispose() {
    _usuarioStreamController.close();
  }
}

final usuarioService = _UsuarioService();
