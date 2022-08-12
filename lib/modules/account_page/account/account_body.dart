import 'package:account/modules/account_page/account/card_button.dart';
import 'package:account/modules/account_page/account/image_in_stack.dart';
import 'package:account/modules/account_page/account/info_card.dart';
import 'package:account/modules/account_page/expanded.dart';
import 'package:account/shared/components/constants.dart';
import 'package:account/shared/resources/colors.dart';
import 'package:flutter/material.dart';
import 'request_button.dart';

class Bodys extends StatefulWidget {
  const Bodys({Key? key}) : super(key: key);

  @override
  State<Bodys> createState() => _BodysState();
}

//content of acc page
class _BodysState extends State<Bodys> {
  bool _expand = false;
  int current = 0;
  List txts = ['Requests', 'Cards'];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: ListView(
        children: [
          Column(
            children: [
              //stack of image & infocard
              Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  SizedBox(
                    height: _expand ? size.height * .35 + 60 : 120,
                  ),
                  ExpandedSection(
                    expand: _expand,
                    child: InfoCard(
                      height: size.height * .35,
                    ),
                  ),
                  Positioned.fill(
                      child: Align(
                          alignment: Alignment.topCenter,
                          child: InkWell(
                              onTap: () {
                                setState(() {
                                  _expand = !_expand;
                                });
                              },
                              child: const ImageAc()))),
                ],
              ),
              free(),
              //the 2 buttons
              Container(
                height: 60,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: second, borderRadius: BorderRadius.circular(40)),
                child: Row(children: [
                  for (int i = 0; i < txts.length; i++)
                    InkWell(
                      child: decide((size.width / 2) - 20, txts[i], i),
                      onTap: () {
                        setState(() {
                          current = i;
                        });
                      },
                    )
                ]),
              ),
              //deside shown of content of 2 buttons
              current == 1
                  ? Column(
                      children: [
                        free(),
                        Cards(
                          height: size.height * .2,
                          width: size.width * .7,
                        ),
                      ],
                    )
                  : Column(
                      children: [
                        free(),
                        Requests(
                          height: size.height * .25,
                        ),
                      ],
                    ),
            ],
          ),
        ],
      ),
    );
  }

  Widget decide(double wth, String txt, int index) {
    if (current == index) {
      //active button
      return designOfButtons(wth, txt, color: bg);
    } else {
      //non-active button
      return designOfButtons(wth, txt);
    }
  }
}
