import 'package:account/app/expanded.dart';
import 'package:account/resources/colors.dart';
import 'package:account/resources/consts.dart';
import 'package:account/resources/styles.dart';
import 'package:flutter/material.dart';

import 'sets.dart';

//appbar
class PersonalAccount extends StatefulWidget {
  const PersonalAccount({Key? key}) : super(key: key);

  @override
  State<PersonalAccount> createState() => _PersonalAccountState();
}

class _PersonalAccountState extends State<PersonalAccount> {
  List<Map<String, Object>> items = [
    {'txt': 'Favorite', 'icon': Icons.favorite, 'id': 1},
    {'txt': 'Settings', 'icon': Icons.settings, 'id': 2},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.menu),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: PopupMenuButton(
              onSelected: (value) {
                if (value == 1) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Favorite()));
                } else {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Settings()));
                }
              },
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              color: second,
              icon: const Icon(Icons.person),
              itemBuilder: (context) {
                return items
                    .map((e) => PopupMenuItem(
                        value: e['id'],
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Icon(
                                  e['icon'] as IconData,
                                  color: primary,
                                ),
                                freeH,
                                Text(
                                  e['txt'] as String,
                                  style: getTitle(
                                    color: white.withOpacity(.5),
                                  ),
                                )
                              ],
                            )
                          ],
                        )))
                    .toList();
              },
            ),
          )
        ],
      ),
      body: const Bodys(),
    );
  }
}

//total
class Bodys extends StatefulWidget {
  const Bodys({Key? key}) : super(key: key);

  @override
  State<Bodys> createState() => _BodysState();
}

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
              //image & infocard
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
                              child: ImageAc()))),
                ],
              ),
              freeV,
              /* Buttons(
                width: (size.width / 2) - 20,
              ), */
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
              current == 1?
              Column(
                children: [
                  freeV,
                  Cards(
                    height: size.height * .2,
                    width: size.width * .7,
                  ),
                ],
              ):
              Column(
                children: [
                  freeV,
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

  Widget decide(double width, String txt, int index) {
    if (current == index) {
      return tapped(width, txt);
    } else {
      return notapped(width, txt);
    }
  }

  //active button
  Widget tapped(double wth, String txt) {
    return Container(
      height: 60,
      width: wth,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
        color: bg,
      ),
      child: Center(
        child: Text(
          txt,
          style: getTitle(color: white.withOpacity(.5)),
        ),
      ),
    );
  }

//not active button
  Widget notapped(double wth, String txt) {
    return Container(
      height: 60,
      width: wth,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
        //color: bg,
      ),
      child: Center(
        child: Text(
          txt,
          style: getTitle(color: white.withOpacity(.3)),
        ),
      ),
    );
  }
}

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

//personal info card
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
          freeV,
          Divider(
            color: white.withOpacity(.5),
            height: 8,
          ),
          freeV,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              end('projects', '736'),
              Container(
                color: white.withOpacity(.5),
                height: 40,
                width: 1.5,
              ),
              end('available', '4 days'),
              Container(
                color: white.withOpacity(.5),
                height: 40,
                width: 1.5,
              ),
              end('followers', '1828'),
            ],
          )
        ],
      ),
    );
  }

  Widget end(String txt, detail) {
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

/* 
//2 buttons
class Buttons extends StatelessWidget {
  const Buttons({Key? key, required this.width}) : super(key: key);
  final double width;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: double.infinity,
      decoration:
          BoxDecoration(color: second, borderRadius: BorderRadius.circular(40)),
      child: Row(children: [
        tapped(width, 'Requests'),
        notapped(width, 'Cards'),
      ]),
    );
  }
//active button
  Widget tapped(double wth, String txt) {
    return Container(
      height: 60,
      width: wth,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
        color: bg,
      ),
      child: Center(
        child: Text(
          txt,
          style: getTitle(color: white.withOpacity(.5)),
        ),
      ),
    );
  }
//not active button
  Widget notapped(double wth, String txt) {
    return Container(
      height: 60,
      width: wth,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
        //color: bg,
      ),
      child: Center(
        child: Text(
          txt,
          style: getTitle(color: white.withOpacity(.3)),
        ),
      ),
    );
  }
}
 */
//cards of card button
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
        freeV,
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
        freeH,
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
            freeV,
            freeV,
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

//requests of request button
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
        freeV,
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
        freeH,
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
            freeV,
            freeV,
            Row(
              children: [
                button(delete, 'Delete'),
                freeH,
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
