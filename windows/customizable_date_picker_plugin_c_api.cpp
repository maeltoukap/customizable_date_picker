#include "include/customizable_date_picker/customizable_date_picker_plugin_c_api.h"

#include <flutter/plugin_registrar_windows.h>

#include "customizable_date_picker_plugin.h"

void CustomizableDatePickerPluginCApiRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  customizable_date_picker::CustomizableDatePickerPlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}
