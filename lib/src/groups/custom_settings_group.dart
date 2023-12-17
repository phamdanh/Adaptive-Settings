import 'package:flutter/material.dart';

import 'base_settings_group.dart';

class CustomSettingsGroup extends BaseSettingsGroup {
  const CustomSettingsGroup({
    required this.child,
    Key? key,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return child;
  }
}
