import 'package:firebase_database/firebase_database.dart';

class MyFirebaseRTDatabase {
  final ref = FirebaseDatabase.instance.ref();
  String data = '0';

  List<Map<String, Map<String, String>>> listaDeMapas = [
    {
      'Tanque1': {
        'cmd_open_valve_in': 'value',
        'cmd_open_valve_out': 'value',
        'var_nivel_agua': 'value',
        'var_caudal_in': 'value',
        'var_caudal_out': 'value',
        'var_switch_high_nivel': 'value',
      },
      'Tanque2': {
        'cmd_open_valve_in': 'value',
        'cmd_open_valve_out': 'value',
        'var_nivel_agua': 'value',
        'var_caudal_in': 'value',
        'var_caudal_out': 'value',
        'var_switch_high_nivel': 'value',
      },
      'Tanque3': {
        'cmd_open_valve_in': 'value',
        'cmd_open_valve_out': 'value',
        'var_nivel_agua': 'value',
        'var_caudal_in': 'value',
        'var_caudal_out': 'value',
        'var_switch_high_nivel': 'value',
      },
      'Tanque4': {
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
          final ruta = '$tanqueNombre/$propiedad';
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


  Future<String> readData() async{
    final snapshot = await ref.child('Tanque1/var_caudal_out').get();
    String data= '';
    if (snapshot.exists) {
      print(snapshot.value);
      data =snapshot.value.toString();
    } else {
      print('No data available.');
    }
    return data;
  }

  Future<void> writeData() async {
    // Only update the name, leave the age and address!
    // await ref.child('Tanque1').update({
    //   "cmd_open_valve_in": 1,
    // });
  }

}
