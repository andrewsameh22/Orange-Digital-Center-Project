import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../presentation/styles/colours.dart';

//This btn use for create a copy
class CopyButton extends StatelessWidget {
  String link;

  CopyButton({Key? key, required this.link}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          // showing snakbar when copying
          Clipboard.setData(ClipboardData(text: link));
          showTopSnackBar(
            context,
            const CustomSnackBar.info(
              message: "Copied",
            ),
          );
        },

        //copy icon
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Icon(
            Icons.copy,
            color: primaryColor,
          ),
        ));
  }
}
