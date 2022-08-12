//requests of request button
import 'package:flutter/material.dart';
import '../../../shared/components/constants.dart';
import '../../../shared/resources/colors.dart';
import '../../../shared/resources/styles.dart';

class Requests extends StatelessWidget {
  const Requests({Key? key, required this.height}) : super(key: key);
  final double height;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              'Requests',
              style: getTitle(color: white.withOpacity(.4)),
            )
          ],
        ),
        free(),
        for (int i = 0; i < 20; i++) list(height),
      ],
    );
  }

  Widget list(double hgt) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.all(10),
      width: double.infinity,
      height: hgt,
      decoration:
          BoxDecoration(color: bg, borderRadius: BorderRadius.circular(15)),
      child: infoList(),
    );
  }

  Widget infoList() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        //image
        Container(
          height: 60,
          width: 60,
          decoration: const BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                  image: AssetImage('assets/image/images (15).jpeg'))),
        ),
        free(),
        //data
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Asmahan Ali',
              style: getTitle(color: white.withOpacity(.5)),
            ),
            Text(
              'flutter app programming',
              style: getLight(color: white.withOpacity(.3)),
            ),
            free(),
            free(),
            Row(
              children: [
                button(delete, 'Delete'),
                free(),
                button(second, 'Confirm'),
              ],
            )
          ],
        )
      ],
    );
  }

  Widget button(Color color, String txt) {
    return Container(
      height: 40,
      width: 100,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
          child: Text(
        txt,
        style: getLight(color: white.withOpacity(.5)),
      )),
    );
  }
}
