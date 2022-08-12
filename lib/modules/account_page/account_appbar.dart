import 'package:account/modules/another_pages/favorite.dart';
import 'package:account/modules/another_pages/settings.dart';
import 'package:account/shared/components/constants.dart';
import 'package:account/shared/components/consts.dart';
import 'package:account/shared/resources/colors.dart';
import 'package:account/shared/resources/styles.dart';
import 'package:flutter/material.dart';
import 'account_body.dart';

//appbar
class PersonalAccount extends StatefulWidget {
  const PersonalAccount({Key? key}) : super(key: key);

  @override
  State<PersonalAccount> createState() => _PersonalAccountState();
}

class _PersonalAccountState extends State<PersonalAccount> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.menu),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: PopupMenuButton(
              onSelected: (value) {
                if (value == 1) {
                  navigatorPush(ctx: context, neededPage: const Favorite());
                } else {
                  navigatorPush(ctx: context, neededPage: const Settings());
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
                                free(),
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
