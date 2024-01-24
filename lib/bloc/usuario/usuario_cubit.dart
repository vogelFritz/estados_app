import 'package:estados_app/models/usuario.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'usuario_state.dart';

class UsuarioCubit extends Cubit<UsuarioState> {
  UsuarioCubit() : super(UsuarioInitial());
  void seleccionarUsuario(Usuario u) {
    emit(UsuarioActivo(u));
  }

  void cambiarEdad(int edad) {
    final currentState = state;
    if (currentState is UsuarioActivo) {
      emit(UsuarioActivo(currentState.usuario.copyWith(edad: edad)));
    }
  }

  void agregarProfesion() {
    final currentState = state;
    if (currentState is UsuarioActivo) {
      final profesiones = [
        ...currentState.usuario.profesiones,
        'Profesión ${currentState.usuario.profesiones.length}',
      ];
      emit(UsuarioActivo(
          currentState.usuario.copyWith(profesiones: profesiones)));
    }
  }

  void borrarUsuario() {
    emit(UsuarioInitial());
  }
}
