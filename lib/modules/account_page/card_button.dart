import 'package:account/shared/components/constants.dart';
import 'package:flutter/material.dart';
import '../../../shared/resources/colors.dart';
import '../../../shared/resources/styles.dart';

// of card button
class Cards extends StatelessWidget {
  const Cards({Key? key, required this.height, required this.width})
      : super(key: key);
  final double height, width;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              'Cards',
              style: getTitle(color: white.withOpacity(.4)),
            )
          ],
        ),
        free(),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              for (int i = 0; i < 20; i++)
                Container(
                  padding: const EdgeInsets.all(8),
                  margin: const EdgeInsets.only(right: 20),
                  height: height,
                  width: width,
                  decoration: BoxDecoration(
                      color: bg, borderRadius: BorderRadius.circular(15)),
                  child: infoCard(),
                ),
            ],
          ),
        )
      ],
    );
  }

  Widget infoCard() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
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
            Text(
              'jan 25th - 31th',
              style: getLight(color: white.withOpacity(.08)),
            ),
          ],
        )
      ],
    );
  }
}
