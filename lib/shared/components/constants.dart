import 'package:account/shared/resources/colors.dart';
import 'package:account/shared/resources/styles.dart';
import 'package:flutter/material.dart';

Widget free({double h = 20, double w = 20}) {
  return SizedBox(
    height: h,
    width: w,
  );
}

ThemeData getThemes() {
  return ThemeData(
    iconTheme: const IconThemeData(
      color: white,
      size: 24,
    ),
    appBarTheme: const AppBarTheme(
      color: Colors.transparent,
      elevation: 0,
    ),
    scaffoldBackgroundColor: primary,
    primaryColor: primary,
  );
}

Future navigatorPush({required BuildContext ctx, required Widget neededPage}) {
  return Navigator.push(
      ctx, MaterialPageRoute(builder: (context) => neededPage));
}

Widget designOfButtons(wth, txt, {color = Colors.transparent}) {
  return Container(
    height: 60,
    width: wth,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(40),
      color: color,
    ),
    child: Center(
      child: Text(
        txt,
        style: getTitle(color: white.withOpacity(.5)),
      ),
    ),
  );
}
