import 'package:estados_app/bloc/usuario/usuario_bloc.dart';
import 'package:estados_app/models/usuario.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Pagina2Page extends StatelessWidget {
  const Pagina2Page({super.key});

  @override
  Widget build(BuildContext context) {
    final usuarioBloc = BlocProvider.of<UsuarioBloc>(context, listen: false);
    return Scaffold(
      appBar: AppBar(title: const Text('Página 2')),
      body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        MaterialButton(
          onPressed: () {
            final usuario = Usuario(nombre: 'Juan', edad: 3423, profesiones: [
              'FullStack Developer',
              'Gamer',
              'Abogado',
              'Panadero',
            ]);
            usuarioBloc.add(UsuarioActualizado(usuario));
          },
          color: Colors.blue,
          child: const Text('Establecer usuario',
              style: TextStyle(color: Colors.white)),
        ),
        MaterialButton(
          onPressed: () {
            usuarioBloc.add(EdadCambiada(30));
          },
          color: Colors.blue,
          child:
              const Text('Cambiar edad', style: TextStyle(color: Colors.white)),
        ),
        MaterialButton(
          onPressed: () {
            usuarioBloc.add(ProfesionAgregada('Speedrunner'));
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
