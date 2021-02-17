import Flutter
import UIKit
import FirebaseAnalytics

public class SwiftFlutterFirebaseInstanceIdPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "flutter_firebase_instance_id", binaryMessenger: registrar.messenger())
    let instance = SwiftFlutterFirebaseInstanceIdPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    switch call.method {
    case "getPlatformVersion":
        result("iOS " + UIDevice.current.systemVersion)
        break
    case "getFirebaseInstanceId":
        getFirebaseInstanceId(result: result)
        break
    default:
        print ("Method not implemented")
    }
  }
  
  func getFirebaseInstanceId(result: @escaping FlutterResult) {
    result(Analytics.appInstanceID())
  }
}
