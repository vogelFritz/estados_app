import 'package:flutter/material.dart';

class Pagina2Page extends StatelessWidget {
  const Pagina2Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Página 2')),
      body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        MaterialButton(
          onPressed: () {},
          color: Colors.blue,
          child: const Text('Establecer usuario',
              style: TextStyle(color: Colors.white)),
        ),
        MaterialButton(
          onPressed: () {},
          color: Colors.blue,
          child:
              const Text('Cambiar edad', style: TextStyle(color: Colors.white)),
        ),
        MaterialButton(
          onPressed: () {},
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
