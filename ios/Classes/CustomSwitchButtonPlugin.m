#import "CustomSwitchButtonPlugin.h"
#if __has_include(<custom_switch_button/custom_switch_button-Swift.h>)
#import <custom_switch_button/custom_switch_button-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "custom_switch_button-Swift.h"
#endif

@implementation CustomSwitchButtonPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftCustomSwitchButtonPlugin registerWithRegistrar:registrar];
}
@end
