import 'package:account/shared/resources/colors.dart';
import 'package:account/shared/resources/styles.dart';
import 'package:flutter/material.dart';

Widget allPageDesign({title, content}) {
  return Scaffold(
    appBar: AppBar(
      backgroundColor: second,
      centerTitle: true,
      title: Text(
        title,
        style: getHeader(color: white.withOpacity(.7)),
      ),
    ),
    body: Center(
      child: Text(
        content,
        style: getLight(color: white.withOpacity(.3)),
      ),
    ),
  );
}
