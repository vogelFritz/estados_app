import 'package:estados_app/models/usuario.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:estados_app/services/usuario_service.dart';

class Pagina1Page extends StatelessWidget {
  const Pagina1Page({super.key});

  @override
  Widget build(BuildContext context) {
    final usuarioService = Provider.of<UsuarioService>(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Página 1'), actions: [
        IconButton(
            onPressed: usuarioService.existeUsuario
                ? usuarioService.removerUsuario
                : null,
            icon: const Icon(Icons.delete_forever))
      ]),
      body: usuarioService.existeUsuario
          ? _InformacionUsuario(usuarioService.usuario!)
          : const Center(child: Text('No hay usuario')),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, 'pagina2');
        },
        child: const Icon(Icons.arrow_back_sharp),
      ),
    );
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
