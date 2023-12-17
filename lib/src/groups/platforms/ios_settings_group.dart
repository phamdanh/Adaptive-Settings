import 'package:flutter/material.dart';
import '../../../adaptive_settings.dart';

class IOSSettingsGroup extends StatelessWidget {
  const IOSSettingsGroup({
    required this.tiles,
    required this.margin,
    required this.title,
    Key? key,
  }) : super(key: key);

  final List<BaseSettingsTile> tiles;
  final EdgeInsetsDirectional? margin;
  final Widget? title;

  @override
  Widget build(BuildContext context) {
    final theme = SettingsTheme.of(context);
    final isLastNonDescriptive =
        tiles.last is SettingsTile && (tiles.last as SettingsTile).description == null;

    return Padding(
      padding: margin ??
          EdgeInsets.only(
            top: 16,
            bottom: isLastNonDescriptive ? 28 : 12,
            left: 16,
            right: 16,
          ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (title != null)
            Padding(
              padding: EdgeInsetsDirectional.only(
                start: 16,
                bottom: 8,
              ),
              child: DefaultTextStyle(
                style: TextStyle(
                  color: theme.themeData.titleTextColor,
                  fontSize: 13,
                ),
                child: title!,
              ),
            ),
          buildTileList(),
        ],
      ),
    );
  }

  Widget buildTileList() {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: tiles.length,
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        final tile = tiles[index];

        var enableTop = false;

        if (index == 0 ||
            (index > 0 &&
                tiles[index - 1] is SettingsTile &&
                (tiles[index - 1] as SettingsTile).description != null)) {
          enableTop = true;
        }

        var enableBottom = false;

        if (index == tiles.length - 1 ||
            (index < tiles.length && tile is SettingsTile && (tile).description != null)) {
          enableBottom = true;
        }

        return SettingsTileAdditionalInfo(
          enableTopBorderRadius: enableTop,
          enableBottomBorderRadius: enableBottom,
          needToShowDivider: index != tiles.length - 1,
          child: tile,
        );
      },
    );
  }
}