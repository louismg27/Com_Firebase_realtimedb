import 'dart:convert';

import 'package:commrealtimedatabase/models/firebase_model_cat_tank.dart';
import 'package:firebase_database/firebase_database.dart';

class MyFirebaseRTDatabase {
  final ref = FirebaseDatabase.instance.ref();

  String data = '0';

  List<Map<String, Map<String, String>>> listaDeMapas = [
    {
      'Tanque1': {
        'ntanque': '1',
        'cmd_open_valve_in': 'value',
        'cmd_open_valve_out': 'value',
        'var_nivel_agua': 'value',
        'var_caudal_in': 'value',
        'var_caudal_out': 'value',
        'var_switch_high_nivel': 'value',
      },
      'Tanque2': {
        'ntanque': '2',
        'cmd_open_valve_in': 'value',
        'cmd_open_valve_out': 'value',
        'var_nivel_agua': 'value',
        'var_caudal_in': 'value',
        'var_caudal_out': 'value',
        'var_switch_high_nivel': 'value',
      },
      'Tanque3': {
        'ntanque': '3',
        'cmd_open_valve_in': 'value',
        'cmd_open_valve_out': 'value',
        'var_nivel_agua': 'value',
        'var_caudal_in': 'value',
        'var_caudal_out': 'value',
        'var_switch_high_nivel': 'value',
      },
      'Tanque4': {
        'ntanque': '4',
        'cmd_open_valve_in': 'value',
        'cmd_open_valve_out': 'value',
        'var_nivel_agua': 'value',
        'var_caudal_in': 'value',
        'var_caudal_out': 'value',
        'var_switch_high_nivel': 'value',
      },
    }
  ];

  void createData() {
    listaDeMapas.forEach((tanque) {
      tanque.forEach((tanqueNombre, propiedades) {
        propiedades.forEach((propiedad, valor) {
          final ruta = 'tanks/$tanqueNombre/$propiedad';
          existRoot(ruta).then((bool exists) {
            if (!exists) {
              ref.child(ruta).set(valor).then((_) {
                print('Datos creados exitosamente para $ruta');
              }).catchError((error) {
                print('Error al crear datos para $ruta: $error');
                // Manejo de errores aquí
              });
            }
          }).catchError((error) {
            print('Error al verificar la existencia de $ruta: $error');
            // Manejo de errores aquí
          });
        });
      });
    });
  }

  Future<bool> existRoot(String path) async {
    final snapshot = await ref.child(path).get();
    return snapshot.exists;
  }

  Future<String> readData(String collection) async {
    final snapshot = await ref.child(collection).get();
    String data = '';
    if (snapshot.exists) {
      // Convertir el mapa de Firebase a JSON válido con las claves entre comillas
      data = json.encode(snapshot.value);

    } else {
      print('No data available.');
    }
    return data;
  }


  Future<List<CatTank>> readListDataTank() async {
    List<CatTank> catTankList = [];
    String dataFirebaseString = await readData('tanks');
    // Verificar si los datos de Firebase no están vacíos
    if (dataFirebaseString.isNotEmpty) {
      // Convertir la cadena JSON en un mapa de Dart
     Map<String, dynamic> firebaseData = json.decode(dataFirebaseString);
      // Iterar sobre cada entrada en el mapa de datos de Firebase

      firebaseData.forEach((key, value) {
        // Crear una instancia de CatTank utilizando fromJson
        CatTank tank = CatTank.fromJson(value);
        // Agregar el tanque a la lista
        catTankList.add(tank);
      });
    }
    return catTankList;
  }

  Future<void> updateData(String doc,String variable,int value) async {
    await ref.child('tanks').child(doc).update({
      variable: value.toString(),
    });
  }
}
