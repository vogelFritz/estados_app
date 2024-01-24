import 'package:estados_app/controllers/usuario_controller.dart';
import 'package:estados_app/models/usuario.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Pagina1Page extends StatelessWidget {
  const Pagina1Page({super.key});

  @override
  Widget build(BuildContext context) {
    final usuarioController = Get.put(UsuarioController());
    return Scaffold(
      appBar: AppBar(title: const Text('Página 1')),
      body: Obx(() => usuarioController.usuarioExiste.value
          ? _InformacionUsuario(usuarioController.usuario.value)
          : const _NoInfo()),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //Navigator.pushNamed(context, 'pagina2');
          //Get.to(const Pagina2Page());
          Get.toNamed('pagina2', arguments: {
            'nombre': 'Juan',
            'edad': 3423,
          });
        },
        child: const Icon(Icons.arrow_back_sharp),
      ),
    );
  }
}

class _NoInfo extends StatelessWidget {
  const _NoInfo();

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('No hay usuario seleccionado'));
  }
}

class _InformacionUsuario extends StatelessWidget {
  final Usuario usuario;
  const _InformacionUsuario(this.usuario);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const Text('General',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        const Divider(),
        ListTile(title: Text('Nombre: ${usuario.nombre}')),
        ListTile(title: Text('Edad: ${usuario.edad}')),
        const ListTile(title: Text('Profesiones: ')),
        ...usuario.profesiones
            .map((profesion) => ListTile(title: Text(profesion)))
            .toList(),
      ]),
    );
  }
}
