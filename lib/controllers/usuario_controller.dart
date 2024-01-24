import 'package:estados_app/models/usuario.dart';
import 'package:get/get.dart';

class UsuarioController extends GetxController {
  var usuarioExiste = false.obs;
  var usuario = Usuario().obs;

  int get numProfesiones {
    return usuario.value.profesiones.length + 1;
  }

  void cargarUsuario(Usuario u) {
    usuarioExiste.value = true;
    usuario.value = u;
  }

  void cambiarEdad(int edad) {
    usuario.update((usuario) {
      usuario!.edad = edad;
    });
  }

  void agregarProfesion(String profesion) {
    usuario.update((usuario) {
      usuario!.profesiones = [...usuario.profesiones, profesion];
    });
  }
}
