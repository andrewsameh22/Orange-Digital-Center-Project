import 'package:flutter/material.dart';
import 'package:odc_flutter/presentation/screens/login/login_screen.dart';
import 'package:odc_flutter/presentation/styles/colours.dart';
import 'package:odc_flutter/presentation/styles/constants.dart';
import 'package:percent_indicator/percent_indicator.dart';

import '../home/home_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                ODCImg,
                height: MediaQuery.of(context).size.height * 0.4,
                width: MediaQuery.of(context).size.width * 1,
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: LinearPercentIndicator(
              animation: true,
              lineHeight: 7.0,
              animationDuration: 2000,
              percent: 1,
              barRadius: Radius.circular(20),
              progressColor: primaryColor,
              onAnimationEnd: () {
                accessToken == ""
                    ? Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => LoginScreen()),
                        (Route<dynamic> route) => false)
                    : Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => Home()),
                        (Route<dynamic> route) => false);
              },
            ),
          ),
        ],
      ),
    );
  }
}
