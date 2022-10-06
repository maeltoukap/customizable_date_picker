import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:customizable_date_picker/customizable_date_picker_method_channel.dart';

void main() {
  MethodChannelCustomizableDatePicker platform = MethodChannelCustomizableDatePicker();
  const MethodChannel channel = MethodChannel('customizable_date_picker');

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
    expect(await platform.getPlatformVersion(), '42');
  });
}
