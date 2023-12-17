import 'package:flutter/material.dart';

abstract class BaseSettingsTile extends StatelessWidget {
  const BaseSettingsTile({super.key});
}

class SettingsTileAdditionalInfo extends InheritedWidget {
  final bool needToShowDivider;
  final bool enableTopBorderRadius;
  final bool enableBottomBorderRadius;

  const SettingsTileAdditionalInfo({
    super.key,
    required this.needToShowDivider,
    required this.enableTopBorderRadius,
    required this.enableBottomBorderRadius,
    required Widget child,
  }) : super(child: child);

  @override
  bool updateShouldNotify(SettingsTileAdditionalInfo oldWidget) => true;

  static SettingsTileAdditionalInfo of(BuildContext context) {
    final SettingsTileAdditionalInfo? result =
        context.dependOnInheritedWidgetOfExactType<SettingsTileAdditionalInfo>();
    return result ??
        const SettingsTileAdditionalInfo(
          needToShowDivider: true,
          enableBottomBorderRadius: true,
          enableTopBorderRadius: true,
          child: SizedBox(),
        );
  }
}
