//personal info card
import 'package:account/shared/components/constants.dart';
import 'package:account/shared/resources/colors.dart';
import 'package:account/shared/resources/styles.dart';
import 'package:flutter/material.dart';

class InfoCard extends StatelessWidget {
  const InfoCard({Key? key, required this.height}) : super(key: key);
  final double height;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      width: double.infinity,
      height: height,
      decoration:
          BoxDecoration(color: second, borderRadius: BorderRadius.circular(40)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          //name,icon
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Asmahan Ali',
                style: getHeader(color: white.withOpacity(.7)),
              ),
              Container(
                height: 40,
                width: 40,
                decoration:
                    const BoxDecoration(color: primary, shape: BoxShape.circle),
                child: const Center(child: Icon(Icons.edit)),
              )
            ],
          ),
          Row(
            children: [
              Text(
                "flutter app programming",
                style: getLight(color: white.withOpacity(.3)),
              ),
            ],
          ),
          free(),
          Divider(
            color: white.withOpacity(.5),
            height: 8,
          ),
          free(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              bottomInfoDesign('projects', '736'),
              Container(
                color: white.withOpacity(.5),
                height: 40,
                width: 1.5,
              ),
              bottomInfoDesign('available', '4 days'),
              Container(
                color: white.withOpacity(.5),
                height: 40,
                width: 1.5,
              ),
              bottomInfoDesign('followers', '1828'),
            ],
          )
        ],
      ),
    );
  }

  Widget bottomInfoDesign(String txt, detail) {
    return Column(
      children: [
        Text(
          txt,
          style: getLight(color: white.withOpacity(.3)),
        ),
        Text(
          detail,
          style: getTitle(color: white.withOpacity(.7)),
        )
      ],
    );
  }
}
