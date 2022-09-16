import 'package:flutter/material.dart';
import 'package:odc_flutter/models/settings_card_model.dart';
import 'package:odc_flutter/presentation/screens/login/login_screen.dart';
import 'package:odc_flutter/presentation/screens/settings_tile_screens/faq.dart';
import 'package:odc_flutter/presentation/styles/colours.dart';

import '../../../ResuableWidgets/default_button.dart';
import '../lectures/lectures_screen.dart';
import '../settings_tile_screens/our_partners.dart';
import '../settings_tile_screens/terms_and_conditions.dart';

class NavSettings extends StatelessWidget {
  List<SettingsCard> settingsCards = [
    SettingsCard(
      title: 'FAQ',
      DestScreen: FAQScreen(),
    ),
    SettingsCard(
      title: 'Terms & Conditions',
      DestScreen: TermsAndConditions(),
    ),
    SettingsCard(
      title: 'Our Partners',
      DestScreen: OurPartners(),
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              var height = MediaQuery.of(context).size.height;
              var width = MediaQuery.of(context).size.width;
              return Container(
                // width:
                //     MediaQuery.of(context).size.width * 0.45,
                child: AlertDialog(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  title: Center(
                    child: Text('Are You sure you want to log out?'),
                  ),
                  actions: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        defButton(
                          context: context,
                          color: Colors.black,
                          text: 'Cancel',
                          onTap: () {
                            Navigator.pop(context);
                          },
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.03,
                        ),
                        defButton(
                          color: primaryColor,
                          text: 'Logout',
                          onTap: () {
                            //pref.clear
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => LoginScreen(),
                                ));
                          },
                          context: context,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                  ],
                ),
              );
            },
          );
        },
        backgroundColor: primaryColor,
        child: Icon(Icons.logout),
      ),
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
            settingsCards[index].title != 'Logout'
                ? Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => settingsCards[index].DestScreen,
                    ))
                : showDialog(
                    context: context,
                    builder: (context) {
                      var height = MediaQuery.of(context).size.height;
                      var width = MediaQuery.of(context).size.width;
                      return Container(
                        // width:
                        //     MediaQuery.of(context).size.width * 0.45,
                        child: AlertDialog(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                          title: Center(
                            child: Text('Are You sure you want to log out?'),
                          ),
                          actions: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                defButton(
                                  context: context,
                                  color: Colors.black,
                                  text: 'Cancel',
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.03,
                                ),
                                defButton(
                                  color: primaryColor,
                                  text: 'Logout',
                                  onTap: () {
                                    //pref.clear
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => LoginScreen(),
                                        ));
                                  },
                                  context: context,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.02,
                            ),
                          ],
                        ),
                      );
                    },
                  );
          },
        ),
      ),
    );
  }
}
