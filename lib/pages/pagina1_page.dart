import 'package:flutter/material.dart';

class Pagina1Page extends StatelessWidget {
  const Pagina1Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Página 1')),
      body: InformacionUsuario(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, 'pagina2');
        },
        child: const Icon(Icons.arrow_back_sharp),
      ),
    );
  }
}

class InformacionUsuario extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      child:
          const Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text('General',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        Divider(),
        ListTile(title: Text('Nombre: ')),
        ListTile(title: Text('Edad: ')),
        ListTile(title: Text('Profesiones: ')),
        ListTile(title: Text('Profesión 1: ')),
        ListTile(title: Text('Profesión 2: ')),
      ]),
    );
  }
}
