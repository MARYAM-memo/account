import 'package:account/shared/components/all_pages_design.dart';
import 'package:flutter/material.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return allPageDesign(title: 'Settings', content: 'This is Settings page');
  }
}
