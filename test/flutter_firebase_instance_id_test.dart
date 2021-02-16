import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_firebase_instance_id/flutter_firebase_instance_id.dart';

void main() {
  const MethodChannel channel = MethodChannel('flutter_firebase_instance_id');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await FlutterFirebaseInstanceId.platformVersion, '42');
  });
}
