import 'package:flutter/material.dart';
import 'package:hq_personal_library/screen/hq_detail_page.dart';
import 'package:hq_personal_library/screen/main_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HQ Personal',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Montserrat',
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routes: {
        MainPage.id: (context) => MainPage(),
        HQDetailPage.id: (context) => HQDetailPage()
      },
      initialRoute: MainPage.id,
    );
  }
}
