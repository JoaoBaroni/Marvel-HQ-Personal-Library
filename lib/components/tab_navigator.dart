import 'package:flutter/material.dart';
import 'package:hq_personal_library/screen/character_page.dart';
import 'package:hq_personal_library/screen/comics_page.dart';
import 'package:hq_personal_library/screen/overview_page.dart';

class TabNavigator extends StatelessWidget {
  final GlobalKey<NavigatorState> navigatorState;
  final int indexItem;

  TabNavigator({this.indexItem, this.navigatorState});


  List<Widget> pages = [
    OverviewPage(),
    ComicsPage(),
    CharacterPage(),
  ];

  @override
  Widget build(BuildContext context) {
    Widget child;
    return Container(
      child: pages[indexItem],
    );
  }
}
