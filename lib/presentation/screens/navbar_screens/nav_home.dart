import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:odc_flutter/presentation/screens/finals/finals_screen.dart';
import 'package:odc_flutter/presentation/screens/lectures/lectures_screen.dart';
import 'package:odc_flutter/presentation/screens/midterms/midterms_screen.dart';
import 'package:odc_flutter/presentation/screens/notes/notes_screen.dart';
import 'package:odc_flutter/presentation/screens/sections/sections_screen.dart';

import '../../../models/home_card_model.dart';
import '../../styles/colours.dart';
import '../../styles/constants.dart';
import '../events/events_screen.dart';
import 'nav_settings.dart';

class NavHome extends StatelessWidget {
  List<HomeCard> homeCards = [
    HomeCard(
      title: 'Lectures',
      ImagePath: lecturesIconSVG,
      DestScreen: LecturesScreen(),
    ),
    HomeCard(
      title: 'Sections',
      ImagePath: sectionsIconSVG,
      DestScreen: SectionsScreen(),
    ),
    HomeCard(
      title: 'Midterms',
      ImagePath: midtermsIconSVG,
      DestScreen: MidtermsScreen(),
    ),
    HomeCard(
      title: 'Finals',
      ImagePath: finalsIconSVG,
      DestScreen: FinalsScreen(),
    ),
    HomeCard(
      title: 'Events',
      ImagePath: eventsIconSVG,
      DestScreen: EventsScreen(),
    ),
    HomeCard(
      title: 'Notes',
      ImagePath: notesIconSVG,
      DestScreen: NotesScreen(),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
                Center(
                  child: Image.asset(
                    ODCImg,
                    fit: BoxFit.cover,
                    height: MediaQuery.of(context).size.height / 11,
                    width: MediaQuery.of(context).size.width / 1.5,
                  ),
                ),
                GridView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 4.0,
                    mainAxisSpacing: 4.0,
                  ),
                  itemCount: homeCards.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    homeCards[index].DestScreen,
                              ));
                        },
                        child: Material(
                          borderRadius: BorderRadius.circular(20.0),
                          color: Colors.white,
                          elevation: 5.0,
                          // decoration: BoxDecoration(
                          //   boxShadow: [
                          //     BoxShadow(
                          //       color: Colors.grey.withOpacity(0.3),
                          //       spreadRadius: 3,
                          //       blurRadius: 5,
                          //       offset:
                          //           Offset(0, 3), // changes position of shadow
                          //     ),
                          //   ],
                          // ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SizedBox(
                                child: Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    Container(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.1,
                                      width:
                                          MediaQuery.of(context).size.height *
                                              0.1,
                                      decoration: BoxDecoration(
                                        color: Colors.grey.shade200,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(100)),
                                      ),
                                    ),
                                    SvgPicture.asset(
                                      homeCards[index].ImagePath,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.06,
                                    ),
                                  ],
                                ),
                              ),
                              Text(
                                homeCards[index].title,
                                style: TextStyle(
                                  color: primaryColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
