import 'package:flutter/material.dart';

import '../presentation/styles/colours.dart';

class CustomAppbar extends StatelessWidget {
  String title;
  CustomAppbar({
    required this.title,
  });
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0.0,
      centerTitle: true,
      title: Text(title),
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back_ios,
          color: primaryColor,
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
