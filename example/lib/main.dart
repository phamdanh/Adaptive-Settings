import 'package:flutter/material.dart';
import 'package:adaptive_settings/adaptive_settings.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Adaptive settings example'),
        ),
        body: DefaultTabController(
            length: 2,
            child: Column(
              children: [
                Container(
                  color: Colors.blue,
                  child: const TabBar(
                    tabs: [
                      Tab(
                        text: "Android",
                      ),
                      Tab(
                        text: "IOS",
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: TabBarView(children: [
                    SettingsScreen(
                      groups: [buildSettingsGroup()],
                      platform: DevicePlatform.android,
                    ),
                    SettingsScreen(
                      groups: [buildSettingsGroup()],
                      platform: DevicePlatform.iOS,
                    ),
                  ]),
                )
              ],
            )),
      ),
    );
  }

  SettingsGroup buildSettingsGroup() {
    return SettingsGroup(
      tiles: [
        SettingsTile.switchTile(
          title: Text("test switch"),
          initialValue: false,
          onToggle: (bool value) {},
        ),
        SettingsTile(
          title: Text("Title"),
          value: Text("value"),
          description: Text("description description"),
        ),
        SettingsTile(
          leading: Icon(Icons.home),
          title: Text("Title"),
          value: Text("value"),
          trailing: Icon(Icons.delete),
        )
      ],
    );
  }
}
