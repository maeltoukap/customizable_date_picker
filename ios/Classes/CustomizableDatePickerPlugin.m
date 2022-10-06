#import "CustomizableDatePickerPlugin.h"
#if __has_include(<customizable_date_picker/customizable_date_picker-Swift.h>)
#import <customizable_date_picker/customizable_date_picker-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "customizable_date_picker-Swift.h"
#endif

@implementation CustomizableDatePickerPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftCustomizableDatePickerPlugin registerWithRegistrar:registrar];
}
@end
