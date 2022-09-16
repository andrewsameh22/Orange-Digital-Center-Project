import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

import '../presentation/styles/colours.dart';

//This btn use for make a share
class ShareButton extends StatelessWidget {
  String link;
  String title;

  ShareButton({
    Key? key,
    required this.link,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          // share(link);
        },

        //share icon
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Icon(
            Icons.share_sharp,
            color: primaryColor,
          ),
        ));
  }

// //open share link view
// Future<void> share(String link) async
// {
//   await FlutterShare.share(
//       title: '$title share link',
//       text: 'Share link',
//       linkUrl: link,
//       chooserTitle: 'Title');
// }
}
