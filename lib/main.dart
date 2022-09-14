import 'package:flutter/material.dart';
import 'package:odc_flutter/presentation/screens/home/home_screen.dart';
import 'package:odc_flutter/presentation/screens/navbar_screens/nav_settings.dart';
import 'package:odc_flutter/presentation/styles/colours.dart';

import 'presentation/screens/splash/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        appBarTheme: AppBarTheme(
          iconTheme: IconThemeData(
            color: primaryColor,
          ),
        ),
      ),
      home: Home(),
    );
  }
}
