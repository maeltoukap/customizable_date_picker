import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'customizable_date_picker_platform_interface.dart';

/// An implementation of [CustomizableDatePickerPlatform] that uses method channels.
class MethodChannelCustomizableDatePicker extends CustomizableDatePickerPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('customizable_date_picker');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
