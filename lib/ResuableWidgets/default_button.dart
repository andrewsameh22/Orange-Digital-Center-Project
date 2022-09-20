import 'package:flutter/material.dart';
import 'package:odc_flutter/presentation/styles/colours.dart';

Widget smalldefaultButton({
  required String text,
  required onpressed,
  required color,
  required context,
  textColor,
}) =>
    Container(
      height: MediaQuery.of(context).size.height * 0.05,
      width: MediaQuery.of(context).size.width * 0.25,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: color,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: MaterialButton(
        child: Text(
          maxLines: 1,
          textAlign: TextAlign.center,
          text,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            color: textColor ?? Colors.white,
            fontSize: 14,
          ),
        ),
        onPressed: onpressed,
      ),
    );
Widget defaultButton({
  required String text,
  required onpressed,
  required color,
  required context,
  textColor,
}) =>
    Container(
      width: MediaQuery.of(context).size.width * 0.275,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: color,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: MaterialButton(
        child: Text(
          textAlign: TextAlign.center,
          text,
          style: TextStyle(
            color: textColor ?? Colors.white,
          ),
        ),
        onPressed: onpressed,
      ),
    );

Widget defButton({
  required String text,
  required GestureTapCallback? onTap,
  required BuildContext context,
  Color color = const Color(0XFF3787ff),
  String imagePath = '',
}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      alignment: Alignment.center,
      height: MediaQuery.of(context).size.height * 0.07,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          imagePath.isNotEmpty
              ? Image(
                  image: AssetImage(imagePath),
                  // height: MediaQuery.of(context).size.width * 0.15,
                  // width: MediaQuery.of(context).size.width * 0.15,
                )
              : Container(),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.01,
          ),
          Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
              fontSize: 22,
              // fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    ),
  );
}

Widget smalldefButton({
  required String text,
  required GestureTapCallback? onTap,
  required BuildContext context,
  Color color = const Color(0XFF3787ff),
  String imagePath = '',
}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      alignment: Alignment.center,
      height: MediaQuery.of(context).size.height * 0.07,
      width: MediaQuery.of(context).size.width * 0.3,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          imagePath.isNotEmpty
              ? Image(
                  image: AssetImage(imagePath),
                  // height: MediaQuery.of(context).size.width * 0.15,
                  // width: MediaQuery.of(context).size.width * 0.15,
                )
              : Container(),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.01,
          ),
          Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
              fontSize: 14,
              // fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    ),
  );
}

Widget emptydefButton({
  required String text,
  required GestureTapCallback? onTap,
  required BuildContext context,
  Color color = const Color(0XFF3787ff),
  String imagePath = '',
}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      alignment: Alignment.center,
      height: MediaQuery.of(context).size.height * 0.07,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: primaryColor, width: 2)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          imagePath.isNotEmpty
              ? Image(
                  image: AssetImage(imagePath),
                  // height: MediaQuery.of(context).size.width * 0.15,
                  // width: MediaQuery.of(context).size.width * 0.15,
                )
              : Container(),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.01,
          ),
          Text(
            text,
            style: const TextStyle(
              color: primaryColor,
              fontWeight: FontWeight.w900,
              fontSize: 22,
              // fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    ),
  );
}
