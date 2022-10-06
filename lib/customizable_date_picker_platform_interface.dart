import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'customizable_date_picker_method_channel.dart';

abstract class CustomizableDatePickerPlatform extends PlatformInterface {
  /// Constructs a CustomizableDatePickerPlatform.
  CustomizableDatePickerPlatform() : super(token: _token);

  static final Object _token = Object();

  static CustomizableDatePickerPlatform _instance = MethodChannelCustomizableDatePicker();

  /// The default instance of [CustomizableDatePickerPlatform] to use.
  ///
  /// Defaults to [MethodChannelCustomizableDatePicker].
  static CustomizableDatePickerPlatform get instance => _instance;
  
  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [CustomizableDatePickerPlatform] when
  /// they register themselves.
  static set instance(CustomizableDatePickerPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
