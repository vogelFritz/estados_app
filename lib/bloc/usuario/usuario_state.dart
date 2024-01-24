part of 'usuario_bloc.dart';

@immutable
abstract class UsuarioState {
  final bool usuarioExiste;
  final Usuario? usuario;
  const UsuarioState({
    this.usuarioExiste = false,
    this.usuario,
  });
}

class UsuarioInicial extends UsuarioState {
  const UsuarioInicial() : super();
}

class UsuarioSeleccionado extends UsuarioState {
  final Usuario nuevoUsuario;
  const UsuarioSeleccionado(this.nuevoUsuario)
      : super(usuarioExiste: true, usuario: nuevoUsuario);
}
