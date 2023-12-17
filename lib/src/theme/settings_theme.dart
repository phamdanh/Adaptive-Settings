import 'package:adaptive_settings/adaptive_settings.dart';
import 'package:flutter/material.dart';

class SettingsTheme extends InheritedWidget {
  final SettingsThemeData themeData;
  final DevicePlatform platform;

  const SettingsTheme({
    super.key,
    required this.themeData,
    required this.platform,
    required Widget child,
  }) : super(child: child);

  @override
  bool updateShouldNotify(SettingsTheme oldWidget) => true;

  static SettingsTheme of(BuildContext context) {
    final SettingsTheme? result = context.dependOnInheritedWidgetOfExactType<SettingsTheme>();
    return result!;
  }
}

class SettingsThemeData {
  const SettingsThemeData({
    this.trailingTextColor,
    this.screenBackground,
    this.groupBackground,
    this.dividerColor,
    this.tileHighlightColor,
    this.titleTextColor,
    this.leadingIconsColor,
    this.tileDescriptionTextColor,
    this.settingsTileTextColor,
    this.inactiveTitleColor,
    this.inactiveSubtitleColor,
  });

  final Color? screenBackground;
  final Color? trailingTextColor;
  final Color? leadingIconsColor;
  final Color? groupBackground;
  final Color? dividerColor;
  final Color? tileDescriptionTextColor;
  final Color? tileHighlightColor;
  final Color? titleTextColor;
  final Color? settingsTileTextColor;
  final Color? inactiveTitleColor;
  final Color? inactiveSubtitleColor;

  SettingsThemeData merge({
    SettingsThemeData? theme,
  }) {
    if (theme == null) return this;

    return copyWith(
        leadingIconsColor: theme.leadingIconsColor,
        tileDescriptionTextColor: theme.tileDescriptionTextColor,
        dividerColor: theme.dividerColor,
        trailingTextColor: theme.trailingTextColor,
        screenBackground: theme.screenBackground,
        groupBackground: theme.groupBackground,
        settingsTileTextColor: theme.settingsTileTextColor,
        tileHighlightColor: theme.tileHighlightColor,
        titleTextColor: theme.titleTextColor,
        inactiveTitleColor: theme.inactiveTitleColor,
        inactiveSubtitleColor: theme.inactiveSubtitleColor);
  }

  SettingsThemeData copyWith({
    Color? screenBackground,
    Color? trailingTextColor,
    Color? leadingIconsColor,
    Color? groupBackground,
    Color? dividerColor,
    Color? tileDescriptionTextColor,
    Color? tileHighlightColor,
    Color? titleTextColor,
    Color? settingsTileTextColor,
    Color? inactiveTitleColor,
    Color? inactiveSubtitleColor,
  }) {
    return SettingsThemeData(
      screenBackground: screenBackground ?? this.screenBackground,
      trailingTextColor: trailingTextColor ?? this.trailingTextColor,
      leadingIconsColor: leadingIconsColor ?? this.leadingIconsColor,
      groupBackground: groupBackground ?? this.groupBackground,
      dividerColor: dividerColor ?? this.dividerColor,
      tileDescriptionTextColor: tileDescriptionTextColor ?? this.tileDescriptionTextColor,
      tileHighlightColor: tileHighlightColor ?? this.tileHighlightColor,
      titleTextColor: titleTextColor ?? this.titleTextColor,
      inactiveTitleColor: inactiveTitleColor ?? this.inactiveTitleColor,
      inactiveSubtitleColor: inactiveSubtitleColor ?? this.inactiveSubtitleColor,
      settingsTileTextColor: settingsTileTextColor ?? this.settingsTileTextColor,
    );
  }
}
