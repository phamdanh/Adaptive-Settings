import 'package:adaptive_settings/adaptive_settings.dart';
import 'package:flutter/material.dart';

import 'platforms/android_settings_group.dart';
import 'platforms/ios_settings_group.dart';
import 'platforms/web_settings_group.dart';

class SettingsGroup extends BaseSettingsGroup {
  const SettingsGroup({
    required this.tiles,
    this.margin,
    this.title,
    Key? key,
  }) : super(key: key);

  final List<BaseSettingsTile> tiles;
  final EdgeInsetsDirectional? margin;
  final Widget? title;

  @override
  Widget build(BuildContext context) {
    final theme = SettingsTheme.of(context);

    switch (theme.platform) {
      case DevicePlatform.android:
      case DevicePlatform.fuchsia:
      case DevicePlatform.linux:
        return AndroidSettingsGroup(
          title: title,
          tiles: tiles,
          margin: margin,
        );
      case DevicePlatform.iOS:
      case DevicePlatform.macOS:
      case DevicePlatform.windows:
        return IOSSettingsGroup(
          title: title,
          tiles: tiles,
          margin: margin,
        );
      case DevicePlatform.web:
        return WebSettingsGroup(
          title: title,
          tiles: tiles,
          margin: margin,
        );
    }
  }
}
