import 'package:flutter/material.dart';
import 'package:hq_personal_library/utils/colors.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController searchField = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Find a character',
          style: TextStyle(color: kSecondaryColor),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: kSecondaryColor,
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 100,
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black12,
                              blurRadius: 5.0,
                              spreadRadius: 0.5,
                              offset: Offset(0.7, 0.7))
                        ]),
                    margin: EdgeInsets.all(10),
                    child: TextField(
                      controller: searchField,
                      decoration: InputDecoration(
                          hintText: 'Search ',
                          filled: true,
                          fillColor: kPrimaryColor,
                          border: InputBorder.none,
                          isDense: true,
                          contentPadding:
                              EdgeInsets.only(left: 10, top: 8, bottom: 8)),
                    ),
                  ),
                ],
              ),
              decoration: BoxDecoration(color: kPrimaryColor, boxShadow: [
                BoxShadow(
                    color: Colors.black12,
                    blurRadius: 5.0,
                    spreadRadius: 0.5,
                    offset: Offset(0.7, 0.7))
              ]),
            ),
            Expanded(
              child: Container(
                color: kPrimaryColor,
              ),
            )
          ],
        ),
      ),
    );
  }
}
