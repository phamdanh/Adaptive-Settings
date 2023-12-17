#include "include/adaptive_settings/adaptive_settings_plugin_c_api.h"

#include <flutter/plugin_registrar_windows.h>

#include "adaptive_settings_plugin.h"

void AdaptiveSettingsPluginCApiRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  adaptive_settings::AdaptiveSettingsPlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}
