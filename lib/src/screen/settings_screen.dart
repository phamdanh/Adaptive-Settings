import 'package:adaptive_settings/adaptive_settings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum ApplicationType {
  /// Use this parameter is you are using the MaterialApp
  material,

  /// Use this parameter is you are using the CupertinoApp
  cupertino,

  /// Use this parameter is you are using the MaterialApp for Android
  /// and the CupertinoApp for iOS.
  both,
}

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({
    super.key,
    required this.groups,
    this.shrinkWrap = false,
    this.physics,
    this.platform,
    this.lightTheme,
    this.darkTheme,
    this.brightness,
    this.contentPadding,
    this.applicationType = ApplicationType.material,
  });

  final bool shrinkWrap;
  final ScrollPhysics? physics;
  final DevicePlatform? platform;
  final SettingsThemeData? lightTheme;
  final SettingsThemeData? darkTheme;
  final Brightness? brightness;
  final EdgeInsetsGeometry? contentPadding;
  final List<BaseSettingsGroup> groups;
  final ApplicationType applicationType;

  @override
  Widget build(BuildContext context) {
    DevicePlatform platform;
    if (this.platform == null) {
      platform = PlatformUtils.detectPlatform(context);
    } else {
      platform = this.platform!;
    }

    final brightness = calculateBrightness(context);

    final themeData = ThemeProvider.getTheme(
      context: context,
      platform: platform,
      brightness: brightness,
    ).merge(theme: brightness == Brightness.dark ? darkTheme : lightTheme);

    return Container(
      color: themeData.screenBackground,
      width: MediaQuery.of(context).size.width,
      alignment: Alignment.center,
      child: SettingsTheme(
        themeData: themeData,
        platform: platform,
        child: ListView.builder(
          physics: physics,
          shrinkWrap: shrinkWrap,
          itemCount: groups.length,
          padding: contentPadding ?? calculateDefaultPadding(platform, context),
          itemBuilder: (BuildContext context, int index) {
            return groups[index];
          },
        ),
      ),
    );
  }

  EdgeInsets calculateDefaultPadding(DevicePlatform platform, BuildContext context) {
    if (MediaQuery.of(context).size.width > 810) {
      double padding = (MediaQuery.of(context).size.width - 810) / 2;
      switch (platform) {
        case DevicePlatform.android:
        case DevicePlatform.fuchsia:
        case DevicePlatform.linux:
        case DevicePlatform.iOS:
        case DevicePlatform.macOS:
        case DevicePlatform.windows:
          return EdgeInsets.symmetric(horizontal: padding);
        case DevicePlatform.web:
          return EdgeInsets.symmetric(vertical: 20, horizontal: padding);
        default:
          return EdgeInsets.symmetric(
            horizontal: padding,
          );
      }
    }
    switch (platform) {
      case DevicePlatform.android:
      case DevicePlatform.fuchsia:
      case DevicePlatform.linux:
      case DevicePlatform.iOS:
      case DevicePlatform.macOS:
      case DevicePlatform.windows:
        return EdgeInsets.zero;
      case DevicePlatform.web:
        return const EdgeInsets.symmetric(vertical: 20);
    }
  }

  Brightness calculateBrightness(BuildContext context) {
    final materialBrightness = Theme.of(context).brightness;
    final cupertinoBrightness =
        CupertinoTheme.of(context).brightness ?? MediaQuery.of(context).platformBrightness;

    switch (applicationType) {
      case ApplicationType.material:
        return materialBrightness;
      case ApplicationType.cupertino:
        return cupertinoBrightness;
      case ApplicationType.both:
        return platform != DevicePlatform.iOS ? materialBrightness : cupertinoBrightness;
    }
  }
}
