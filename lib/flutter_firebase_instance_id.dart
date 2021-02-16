
import 'dart:async';

import 'package:flutter/services.dart';

class FlutterFirebaseInstanceId {
  static const MethodChannel _channel =
      const MethodChannel('flutter_firebase_instance_id');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  static Future<String> get firebaseInstanceId async {
    final String iid = await _channel.invokeMethod('getFirebaseInstanceId');
    return iid;
  }
}
