import 'package:account/resources/styles.dart';
import 'package:flutter/material.dart';

import '../../resources/colors.dart';

class Favorite extends StatelessWidget {
  const Favorite({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: second,
        centerTitle: true,
        title: Text(
          'Favorite',
          style: getHeader(color: white.withOpacity(.7)),
        ),
      ),
      body: Center(
        child: Text(
          'This is Favorite page',
          style: getLight(color: white.withOpacity(.3)),
        ),
      ),
    );
  }
}

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: second,
        centerTitle: true,
        title: Text(
          'Settings',
          style: getHeader(color: white.withOpacity(.7)),
        ),
      ),
      body: Center(
        child: Text(
          'This is Settings page',
          style: getLight(color: white.withOpacity(.3)),
        ),
      ),
    );
  }
}
