import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter_firebase_instance_id/flutter_firebase_instance_id.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _platformVersion = 'Unknown';
  String _firebaseInstanceId = 'Unknown';

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String platformVersion;
    String firebaseInstanceId;

    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      platformVersion = await FlutterFirebaseInstanceId.platformVersion;
      firebaseInstanceId = await FlutterFirebaseInstanceId.firebaseInstanceId;
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
      _firebaseInstanceId = firebaseInstanceId;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter App Instance Id'),
        ),
        body: Column(
          children: [
            Text('Your Firebase iid is: $_firebaseInstanceId\n'),
            Text('Running on: $_platformVersion\n'),
          ],
        ),
      ),
    );
  }
}
