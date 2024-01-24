import 'package:estados_app/pages/pagina1_page.dart';
import 'package:estados_app/pages/pagina2_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'pagina1',
      //routes: {
      //  'pagina1': (_) => const Pagina1Page(),
      //  'pagina2': (_) => const Pagina2Page(),
      //},
      getPages: [
        GetPage(name: '/pagina1', page: () => const Pagina1Page()),
        GetPage(name: '/pagina2', page: () => const Pagina2Page()),
      ],
    );
  }
}
