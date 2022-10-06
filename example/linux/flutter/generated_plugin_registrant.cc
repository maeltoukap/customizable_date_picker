//
//  Generated file. Do not edit.
//

// clang-format off

#include "generated_plugin_registrant.h"

#include <customizable_date_picker/customizable_date_picker_plugin.h>

void fl_register_plugins(FlPluginRegistry* registry) {
  g_autoptr(FlPluginRegistrar) customizable_date_picker_registrar =
      fl_plugin_registry_get_registrar_for_plugin(registry, "CustomizableDatePickerPlugin");
  customizable_date_picker_plugin_register_with_registrar(customizable_date_picker_registrar);
}
