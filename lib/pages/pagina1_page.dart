import 'package:estados_app/bloc/usuario/usuario_cubit.dart';
import 'package:estados_app/models/usuario.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Pagina1Page extends StatelessWidget {
  const Pagina1Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Página 1'),
        actions: [
          IconButton(
              onPressed: context.read<UsuarioCubit>().borrarUsuario,
              icon: const Icon(Icons.delete_forever))
        ],
      ),
      body: _ScaffoldBody(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, 'pagina2');
        },
        child: const Icon(Icons.arrow_back_sharp),
      ),
    );
  }
}

class _ScaffoldBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UsuarioCubit, UsuarioState>(builder: (_, state) {
      switch (state.runtimeType) {
        case UsuarioInitial:
          return const Center(child: Text('No hay información del usuario'));
        case UsuarioActivo:
          return _InformacionUsuario((state as UsuarioActivo).usuario);
        default:
          return const Center(child: Text('Estado no reconocido'));
      }
    });
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
