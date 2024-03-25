import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MensajeWidget extends StatelessWidget {
  const MensajeWidget(this.texto, this.fecha);

  final String texto;
  final DateTime fecha;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 1, top: 5, right: 1, bottom: 2),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey[350]!,
                  blurRadius: 2.0,
                  offset: Offset(0, 1.09),
                ),
              ],
              borderRadius: BorderRadius.circular(50.0),
              color: Colors.white,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MaterialButton(
                  disabledTextColor: Colors.black87,
                  padding: EdgeInsets.only(left: 18),
                  onPressed: null,
                  child: Wrap(
                    children: [
                      Container(
                        child: Row(
                          children: [
                            Text(texto),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 4),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Text(
                      DateFormat('dd-MM-yyyy').format(fecha).toString(),
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                ),

              ],
            ),
          )

        ],
      ),
    );
  }
}
