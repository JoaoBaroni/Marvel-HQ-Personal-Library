import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hq_personal_library/components/creator_card.dart';
import 'package:hq_personal_library/components/suggest_item.dart';
import 'package:hq_personal_library/screen/character_page.dart';
import 'package:hq_personal_library/screen/comics_page.dart';
import 'package:hq_personal_library/screen/hq_detail_page.dart';
import 'package:hq_personal_library/utils/colors.dart';

import 'overview_page.dart';

class MainPage extends StatefulWidget {
  static String id = 'MainPage';

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();


  List<BottomNavigationBarItem> bottomNavigationItens = [
    BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
    BottomNavigationBarItem(icon: Icon(FontAwesomeIcons.book), label: 'HQ\'s'),
    BottomNavigationBarItem(icon: Icon(FontAwesomeIcons.personBooth), label: 'Characters'),
    BottomNavigationBarItem(icon: Icon(FontAwesomeIcons.award), label: 'Creators'),
  ];

  List<Widget> pages = [
    OverviewPage(),
    ComicsPage(),
    CharacterPage(),
  ];
  int currentPage = 0;
  final PageStorageBucket bucket = PageStorageBucket();

  void changePage(int newIndex){
    setState(() {
      currentPage = newIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        leading: IconButton(
          icon: Icon(Icons.sort, color: kSecondaryColor),
          onPressed: () =>  _scaffoldState.currentState.openDrawer(),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.account_circle, color: kSecondaryColor),
            onPressed: () => null,
          )
        ],
        elevation: 0,
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentPage,
          selectedItemColor: kAccentColor,
          backgroundColor: kPrimaryColor,
          elevation: 1,
          type: BottomNavigationBarType.fixed,
          onTap: (value) {
            changePage(value);
          },
          items: bottomNavigationItens),
      body: PageStorage(
        bucket: bucket,
        child: pages[currentPage],
      ),
    );
  }
}
