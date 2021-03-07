import 'package:flutter/material.dart';
import 'package:hq_personal_library/components/default_card_comic.dart';
import 'package:hq_personal_library/controller/comics.dart';
import 'package:hq_personal_library/model/comic.dart';
import 'package:hq_personal_library/utils/colors.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController searchField = TextEditingController();
  List<Comic> comicList = [];

  void searchComic(String searchValue) async{
    List<Comic> searchingList = [];
    searchingList = await ComicsController.searchHQ(searchValue);
    setState(() {
      comicList = searchingList;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Find a comic',
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
                      onChanged: (value) => searchComic(value),
                      decoration: InputDecoration(
                          hintText: 'Search a comic',
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
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  child: ListView.separated(itemBuilder: (context, index) => DefaultCardComic(comic: comicList[index], index: index,), separatorBuilder: (context, index) => SizedBox(height: 10,), itemCount: comicList.length),

                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
