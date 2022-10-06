#ifndef FLUTTER_PLUGIN_CUSTOMIZABLE_DATE_PICKER_PLUGIN_H_
#define FLUTTER_PLUGIN_CUSTOMIZABLE_DATE_PICKER_PLUGIN_H_

#include <flutter/method_channel.h>
#include <flutter/plugin_registrar_windows.h>

#include <memory>

namespace customizable_date_picker {

class CustomizableDatePickerPlugin : public flutter::Plugin {
 public:
  static void RegisterWithRegistrar(flutter::PluginRegistrarWindows *registrar);

  CustomizableDatePickerPlugin();

  virtual ~CustomizableDatePickerPlugin();

  // Disallow copy and assign.
  CustomizableDatePickerPlugin(const CustomizableDatePickerPlugin&) = delete;
  CustomizableDatePickerPlugin& operator=(const CustomizableDatePickerPlugin&) = delete;

 private:
  // Called when a method is called on this plugin's channel from Dart.
  void HandleMethodCall(
      const flutter::MethodCall<flutter::EncodableValue> &method_call,
      std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result);
};

}  // namespace customizable_date_picker

#endif  // FLUTTER_PLUGIN_CUSTOMIZABLE_DATE_PICKER_PLUGIN_H_
