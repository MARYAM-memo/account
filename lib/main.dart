import 'package:flutter/material.dart';
import 'app/screens/account.dart';
import 'resources/consts.dart';

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
      title: 'Personal Account',
      theme: getThemes(),
      home: const PersonalAccount(),
    );
  }
}
