import 'dart:async';
import 'package:commrealtimedatabase/widget_conection.dart';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';


class ConnectivityPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InternetConnectionPage();

  }
}

class InternetConnectionPage extends StatefulWidget {
  @override
  _InternetConnectionPageState createState() => _InternetConnectionPageState();
}

class _InternetConnectionPageState extends State<InternetConnectionPage> {
  late InternetConnectionChecker _internetConnectionChecker;
  bool _isConnected = false;
  late StreamSubscription<InternetConnectionStatus> _connectionSubscription;

  @override
  void initState() {
    super.initState();
    _internetConnectionChecker = InternetConnectionChecker();
    _checkConnection();
    _connectionSubscription = _internetConnectionChecker.onStatusChange.listen((status) {
      setState(() {
        _isConnected = status == InternetConnectionStatus.connected;
      });
    });
  }

  @override
  void dispose() {
    _connectionSubscription.cancel();
    super.dispose();
  }

  Future<void> _checkConnection() async {
    final isConnected = await _internetConnectionChecker.hasConnection;
    setState(() {
      _isConnected = isConnected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Internet Connection Checker'),
      ),
      body: Center(
        child: InternetConnectionStatusWidget(status: _isConnected,),
      )
    );
  }
}
