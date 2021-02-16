import Flutter
import UIKit

public class SwiftFlutterFirebaseInstanceIdPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "flutter_firebase_instance_id", binaryMessenger: registrar.messenger())
    let instance = SwiftFlutterFirebaseInstanceIdPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    result("iOS " + UIDevice.current.systemVersion)
  }
}
