part of 'usuario_bloc.dart';

@immutable
abstract class UsuarioEvent {}

class UsuarioActualizado extends UsuarioEvent {
  final Usuario usuario;
  UsuarioActualizado(this.usuario);
}

class EdadCambiada extends UsuarioEvent {
  final int age;
  EdadCambiada(this.age);
}

class ProfesionAgregada extends UsuarioEvent {
  final String profesion;
  ProfesionAgregada(this.profesion);
}

class UsuarioBorrado extends UsuarioEvent {}
