import 'package:account/shared/components/all_pages_design.dart';
import 'package:flutter/material.dart';

class Favorite extends StatelessWidget {
  const Favorite({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return allPageDesign(title: 'Favorite', content: 'This is Favorite page');
  }
}
