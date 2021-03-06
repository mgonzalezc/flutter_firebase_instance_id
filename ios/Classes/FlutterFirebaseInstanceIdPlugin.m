#import "FlutterFirebaseInstanceIdPlugin.h"
#if __has_include(<flutter_firebase_instance_id/flutter_firebase_instance_id-Swift.h>)
#import <flutter_firebase_instance_id/flutter_firebase_instance_id-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "flutter_firebase_instance_id-Swift.h"
#endif

@implementation FlutterFirebaseInstanceIdPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftFlutterFirebaseInstanceIdPlugin registerWithRegistrar:registrar];
}
@end
