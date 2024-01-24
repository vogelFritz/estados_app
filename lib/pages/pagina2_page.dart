import 'package:estados_app/controllers/usuario_controller.dart';
import 'package:estados_app/models/usuario.dart';
import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:get/route_manager.dart';

class Pagina2Page extends StatelessWidget {
  const Pagina2Page({super.key});

  @override
  Widget build(BuildContext context) {
    final usuarioController = Get.find<UsuarioController>();
    return Scaffold(
      appBar: AppBar(title: const Text('Página 2')),
      body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        MaterialButton(
          onPressed: () {
            usuarioController.cargarUsuario(Usuario(
              nombre: 'Juan',
              edad: 3242,
              profesiones: [
                'FullStackDeveloper',
                'Gamer',
                'Panadero',
                'Abogado',
              ],
            ));
            Get.snackbar('Usuario cargado', 'Juan',
                backgroundColor: Get.isDarkMode ? Colors.black : Colors.white,
                boxShadows: [
                  const BoxShadow(color: Colors.black38, blurRadius: 10)
                ]);
          },
          color: Colors.blue,
          child: const Text('Establecer usuario',
              style: TextStyle(color: Colors.white)),
        ),
        MaterialButton(
          onPressed: () {
            usuarioController.cambiarEdad(30);
          },
          color: Colors.blue,
          child:
              const Text('Cambiar edad', style: TextStyle(color: Colors.white)),
        ),
        MaterialButton(
          onPressed: () {
            usuarioController.agregarProfesion(
                'Profesión #${usuarioController.numProfesiones}');
          },
          color: Colors.blue,
          child: const Text('Añadir profesión',
              style: TextStyle(color: Colors.white)),
        ),
        MaterialButton(
          onPressed: () {
            Get.changeTheme(
                Get.isDarkMode ? ThemeData.light() : ThemeData.dark());
          },
          color: Colors.blue,
          child:
              const Text('Cambiar tema', style: TextStyle(color: Colors.white)),
        ),
      ])),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, 'pagina1');
        },
        child: const Icon(Icons.arrow_back_sharp),
      ),
    );
  }
}
