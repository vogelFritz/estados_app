import 'package:bloc/bloc.dart';
import 'package:estados_app/models/usuario.dart';
import 'package:flutter/material.dart';

part 'usuario_event.dart';
part 'usuario_state.dart';

class UsuarioBloc extends Bloc<UsuarioEvent, UsuarioState> {
  UsuarioBloc() : super(const UsuarioInicial()) {
    on<UsuarioActualizado>((event, emit) {
      emit(UsuarioSeleccionado(event.usuario));
    });
    on<EdadCambiada>((event, emit) {
      if (!state.usuarioExiste) return;
      emit(UsuarioSeleccionado(state.usuario!.copyWith(edad: event.age)));
    });
    on<ProfesionAgregada>((event, emit) {
      if (!state.usuarioExiste) return;
      emit(UsuarioSeleccionado(state.usuario!.copyWith(
          profesiones: [...state.usuario!.profesiones, event.profesion])));
    });
    on<UsuarioBorrado>((event, emit) {
      emit(const UsuarioInicial());
    });
  }
}
