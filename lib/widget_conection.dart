import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InternetConnectionStatusWidget extends StatelessWidget {
  final bool status;

  const InternetConnectionStatusWidget({Key? key, required this.status}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          status ? Icons.wifi : Icons.signal_wifi_off,
          size: 80,
          color: status ? Colors.green : Colors.red,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Text(
            status ? "Conectado a Internet" : "Sin conexión a Internet",
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
          ),
        ),
        Text(
          "isOffline ${!status}",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
        )
      ],
    );
  }
}
