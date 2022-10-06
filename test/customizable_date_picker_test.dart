import 'package:flutter_test/flutter_test.dart';
import 'package:customizable_date_picker/customizable_date_picker.dart';
import 'package:customizable_date_picker/customizable_date_picker_platform_interface.dart';
import 'package:customizable_date_picker/customizable_date_picker_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockCustomizableDatePickerPlatform 
    with MockPlatformInterfaceMixin
    implements CustomizableDatePickerPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final CustomizableDatePickerPlatform initialPlatform = CustomizableDatePickerPlatform.instance;

  test('$MethodChannelCustomizableDatePicker is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelCustomizableDatePicker>());
  });

  test('getPlatformVersion', () async {
    CustomizableDatePicker customizableDatePickerPlugin = CustomizableDatePicker();
    MockCustomizableDatePickerPlatform fakePlatform = MockCustomizableDatePickerPlatform();
    CustomizableDatePickerPlatform.instance = fakePlatform;
  
    expect(await customizableDatePickerPlugin.getPlatformVersion(), '42');
  });
}
