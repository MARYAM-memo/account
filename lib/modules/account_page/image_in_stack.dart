import 'package:flutter/material.dart';
import '../../../shared/resources/colors.dart';

//image
class ImageAc extends StatelessWidget {
  const ImageAc({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(alignment: Alignment.center, children: [
      Container(
        height: 120,
        decoration: const BoxDecoration(shape: BoxShape.circle, color: primary),
      ),
      Container(
        height: 100,
        decoration: const BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
                image: AssetImage('assets/image/images (15).jpeg'))),
      )
    ]);
  }
}
