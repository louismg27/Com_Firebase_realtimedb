import 'package:commrealtimedatabase/services/firebase_data.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';

import 'firebase_options.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(  MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Firebase CRUD Example',
      home: FirebaseCRUD(),
    );
  }
}

class FirebaseCRUD extends StatefulWidget {
  @override
  _FirebaseCRUDState createState() => _FirebaseCRUDState();
}

class _FirebaseCRUDState extends State<FirebaseCRUD> {
  final databaseReference = FirebaseDatabase.instance.ref();

  TextEditingController _textEditingController = TextEditingController();
  String data = '';
  String cmdOpenValue1='';
  MyFirebaseRTDatabase databaseRT = MyFirebaseRTDatabase();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    databaseRT.createData();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Firebase CRUD Example'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _textEditingController,
              decoration: InputDecoration(labelText: 'Enter Data'),
              onChanged: (value) {
                data = value;
              },
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: (){},
                  child: Text('Create'),
                ),
                ElevatedButton(
                  onPressed: readData,
                  child: Text('Read'),
                ),
                ElevatedButton(
                  onPressed: updateData,
                  child: Text('Update'),
                ),
                ElevatedButton(
                  onPressed: deleteData,
                  child: Text('Delete'),
                ),
              ],
            ),
            Text("Leido: $cmdOpenValue1")
          ],
        ),
      ),
    );
  }
  void readData() {
    // DatabaseReference ref = FirebaseDatabase.instance.ref('Tanque1/cmd_open1');
    // ref.onValue.listen((DatabaseEvent  event) {
    //   final data = event.snapshot.value;
    //
    // });

    // databaseRT.readData('Tanque2').then((value) {
    //   cmdOpenValue1= value;
    //   setState(() {
    //
    //   });
    // });
     databaseRT.readListDataTank().then((value) {
       value.forEach((element) {print(element);});
     });

  }



  void updateData() {
    // databaseReference.child('message').update({'data': data});
    // _textEditingController.clear();
    databaseRT.updateData('Tanque1','cmd_open_valve_in',1);
  }

  void deleteData() {
    // databaseReference.child('message').remove();
    // _textEditingController.clear();
  }
}




// import 'package:commrealtimedatabase/page_statusinternet.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
//
// import 'listamensajes.dart';
// import 'firebase_options.dart';
//
// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform,
//   );
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: "Ejemplo Chat",
//       theme: ThemeData(primarySwatch: Colors.blue),
//       initialRoute: '/',
//       routes: {
//         '/': (context) => ListaMensajes(),
//         '/connectivity': (context) => ConnectivityPage(),
//       },
//     );
//
//   }
// }
//

