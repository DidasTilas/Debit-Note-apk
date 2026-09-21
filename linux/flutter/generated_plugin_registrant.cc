//
//  Generated file. Do not edit.
//

// clang-format off

#include "generated_plugin_registrant.h"

#include <flutter_secure_storage_linux/flutter_secure_storage_linux_plugin.h>
#include <smart_splash_kit/smart_splash_kit_plugin.h>

void fl_register_plugins(FlPluginRegistry* registry) {
  g_autoptr(FlPluginRegistrar) flutter_secure_storage_linux_registrar =
      fl_plugin_registry_get_registrar_for_plugin(registry, "FlutterSecureStorageLinuxPlugin");
  flutter_secure_storage_linux_plugin_register_with_registrar(flutter_secure_storage_linux_registrar);
  g_autoptr(FlPluginRegistrar) smart_splash_kit_registrar =
      fl_plugin_registry_get_registrar_for_plugin(registry, "SmartSplashKitPlugin");
  smart_splash_kit_plugin_register_with_registrar(smart_splash_kit_registrar);
}
