import 'package:flutter/material.dart';

import '../../ResuableWidgets/news_screen_item.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'News',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView.separated(
            itemBuilder: (context, index) => NewsScreenItem(),
            separatorBuilder: (context, index) => Divider(),
            itemCount: 5),
      ),
    );
  }
}
