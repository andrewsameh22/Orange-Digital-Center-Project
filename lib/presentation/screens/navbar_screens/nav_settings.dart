import 'package:flutter/material.dart';
import 'package:odc_flutter/models/settings_card_model.dart';

import '../lectures/lectures_screen.dart';

class NavSettings extends StatelessWidget {
  List<SettingsCard> settingsCards = [
    SettingsCard(
      title: 'FAQ',
      DestScreen: LecturesScreen(),
    ),
    SettingsCard(
      title: 'Terms & Conditions',
      DestScreen: LecturesScreen(),
    ),
    SettingsCard(
      title: 'Our Partners',
      DestScreen: LecturesScreen(),
    ),
    SettingsCard(
      title: 'Support',
      DestScreen: LecturesScreen(),
    ),
    SettingsCard(
      title: 'Logout',
      DestScreen: LecturesScreen(),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: const Text(
          'Settings',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView.separated(
        separatorBuilder: (BuildContext context, int index) => Divider(),
        itemCount: settingsCards.length,
        itemBuilder: (context, index) => ListTile(
          title: Text(settingsCards[index].title),
          trailing: IconButton(
            icon: Icon(Icons.arrow_forward_ios),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => settingsCards[index].DestScreen,
                ));
          },
        ),
      ),
    );
  }
}
