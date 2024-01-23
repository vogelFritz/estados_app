import 'package:estados_app/models/usuario.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:estados_app/services/usuario_service.dart';

class Pagina2Page extends StatelessWidget {
  const Pagina2Page({super.key});

  @override
  Widget build(BuildContext context) {
    final usuarioService = Provider.of<UsuarioService>(context);
    return Scaffold(
      appBar: AppBar(
          title: usuarioService.existeUsuario
              ? Text(usuarioService.usuario!.nombre)
              : const Text('Página 2')),
      body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        MaterialButton(
          onPressed: () {
            final usuarioService =
                Provider.of<UsuarioService>(context, listen: false);
            final nuevoUsuario = Usuario(
                nombre: 'Juan',
                edad: 29,
                profesiones: ['FullStack Developer', 'Gamer', 'Abogado']);
            usuarioService.usuario = nuevoUsuario;
          },
          color: Colors.blue,
          child: const Text('Establecer usuario',
              style: TextStyle(color: Colors.white)),
        ),
        MaterialButton(
          onPressed: usuarioService.existeUsuario
              ? () => usuarioService.cambiarEdad(8)
              : null,
          color: Colors.blue,
          child:
              const Text('Cambiar edad', style: TextStyle(color: Colors.white)),
        ),
        MaterialButton(
          onPressed: () {
            usuarioService.agregarProfesion();
          },
          color: Colors.blue,
          child: const Text('Añadir profesión',
              style: TextStyle(color: Colors.white)),
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
