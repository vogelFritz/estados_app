import 'package:estados_app/models/usuario.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:estados_app/bloc/usuario/usuario_cubit.dart';

class Pagina2Page extends StatelessWidget {
  const Pagina2Page({super.key});

  @override
  Widget build(BuildContext context) {
    final usuarioCubit = context.read<UsuarioCubit>();
    return Scaffold(
      appBar: AppBar(title: const Text('Página 2')),
      body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        MaterialButton(
          onPressed: () {
            final nuevoUsuario =
                Usuario(nombre: 'Juan', edad: 3432, profesiones: [
              'FullStack Developer',
              'Gamer',
              'Abogado',
            ]);
            usuarioCubit.seleccionarUsuario(nuevoUsuario);
          },
          color: Colors.blue,
          child: const Text('Establecer usuario',
              style: TextStyle(color: Colors.white)),
        ),
        MaterialButton(
          onPressed: () {
            usuarioCubit.cambiarEdad(30);
          },
          color: Colors.blue,
          child:
              const Text('Cambiar edad', style: TextStyle(color: Colors.white)),
        ),
        MaterialButton(
          onPressed: () {
            usuarioCubit.agregarProfesion();
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
