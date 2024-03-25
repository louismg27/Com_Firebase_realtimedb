import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'listamensajes.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Ejemplo Chat",
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: '/',
      routes: {
        '/': (context) => ListaMensajes(),
        '/nueva_pagina': (context) => NuevaPagina(),
      },
    );

  }
}
class NuevaPagina extends StatelessWidget {
  const NuevaPagina({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nueva Página'),
      ),
      body: Center(
        child: Text('Contenido de la nueva página'),
      ),
    );
  }
}