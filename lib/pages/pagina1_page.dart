import 'package:estados_app/models/usuario.dart';
import 'package:estados_app/services/usuario_service.dart';
import 'package:flutter/material.dart';

class Pagina1Page extends StatelessWidget {
  const Pagina1Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Página 1')),
      body: StreamBuilder(
        stream: usuarioService.usuarioStream,
        builder: (context, AsyncSnapshot<Usuario> snapshot) {
          return usuarioService.existeUsuario
              ? _InformacionUsuario()
              : const Center(child: Text('No hay información del usuario'));
        },
      ),
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
  @override
  Widget build(BuildContext context) {
    final Usuario usuario = usuarioService.usuario!;
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
        ListTile(
            title: Text(
                'Profesión 1: ${usuario.profesiones.isEmpty ? '---' : usuario.profesiones[0]}')),
        ListTile(
            title: Text(
                'Profesión 2: ${usuario.profesiones.length <= 2 ? '---' : usuario.profesiones[1]}')),
      ]),
    );
  }
}
