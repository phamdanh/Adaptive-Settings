import 'package:flutter/material.dart';
import 'base_settings_tile.dart';

class CustomSettingsTile extends BaseSettingsTile {
  const CustomSettingsTile({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return child;
  }
}

