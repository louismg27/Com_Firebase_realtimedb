import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'datos/mensaje.dart';
import 'datos/mensaje_dao.dart';
import 'mensajeswidget.dart';

class ListaMensajes extends StatefulWidget {


  final mensajeDao = MensajeDAO();

  @override
  State<ListaMensajes> createState() => _ListaMensajesState();
}

class _ListaMensajesState extends State<ListaMensajes> {
  ScrollController _scrollController = ScrollController();
  TextEditingController _mensajeController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance!.addPostFrameCallback((_) => _scrollHaciaAbajo());

    return Scaffold(
      appBar: AppBar(title: const Text("ejemplo")),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            _getListaMensajes(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: TextField(
                      keyboardType: TextInputType.text,
                      controller:
                          _mensajeController, // Agregar un controlador aquí si es necesario
                      onChanged: (text) => setState(() {}),
                      onSubmitted: (input) {
                        _enviarMensaje();
                      },
                      decoration:
                          const InputDecoration(hintText: "escriir mensaje"),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(_puedoEnviarMensaje()
                      ? CupertinoIcons.arrow_right_circle_fill
                      : CupertinoIcons.arrow_right_circle),
                  onPressed: () {print("sepresiono");},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _enviarMensaje() {
    if (_puedoEnviarMensaje()) {
      final mensaje = Mensaje(_mensajeController.text, DateTime.now());
      print("mensaje");
      widget.mensajeDao.guardarMensaje(mensaje);
      _mensajeController.clear();
      setState(() {});
    }
  }

  bool _puedoEnviarMensaje() => _mensajeController.text.length > 0;

  Widget _getListaMensajes() {
    return Expanded(
      child: FirebaseAnimatedList(
        controller: _scrollController,
        query: widget.mensajeDao.getMensajes(),
        itemBuilder: (context, snapshot, animation, index) {
          final mensajeSnapshot = snapshot as DataSnapshot;
          final mensajeJson = Map<String, dynamic>.from(mensajeSnapshot.value as Map<dynamic, dynamic>);

          final mensaje = Mensaje.fromJson(mensajeJson);
          return MensajeWidget(mensaje.texto, mensaje.fecha);
        },
      ),
    );
  }


  void _scrollHaciaAbajo() {
    if (_scrollController.hasClients) {
      _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
    }
  }
}
