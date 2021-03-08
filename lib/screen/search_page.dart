import 'package:flutter/material.dart';
import 'package:hq_personal_library/components/character_tile.dart';
import 'package:hq_personal_library/components/default_card_comic.dart';
import 'package:hq_personal_library/components/progress_dialog.dart';
import 'package:hq_personal_library/controller/characters.dart';
import 'package:hq_personal_library/controller/comics.dart';
import 'package:hq_personal_library/controller/creators.dart';
import 'package:hq_personal_library/model/character.dart';
import 'package:hq_personal_library/model/comic.dart';
import 'package:hq_personal_library/model/creator.dart';
import 'package:hq_personal_library/utils/colors.dart';
import 'package:hq_personal_library/utils/typesEnum.dart';

class SearchPage extends StatefulWidget {
  final ObjectsTypeMarvel searchType;

  SearchPage({this.searchType});

  @override
  _SearchPageState createState() => _SearchPageState(searchType: searchType);
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController searchField = TextEditingController();
  List<Comic> comicList = [];
  List<Character> characterList = [];
  List<Creator> creatorList = [];
  final ObjectsTypeMarvel searchType;
  var focusDestination = FocusNode();

  bool focused = false;
  void setFocus() {
    if (!focused) {
      FocusScope.of(context).requestFocus(focusDestination);
      focused = true;
    }
  }

  _SearchPageState({this.searchType});

  void searchComic(String searchValue) async{
    List<Comic> searchingList = [];
    searchingList = await ComicsController.searchHQ(searchValue);
    setState(() {
      comicList = searchingList;
    });
  }

  void searchCharacter(String searchValue) async{
    List<Character> searchingList = [];
    searchingList = await CharacterController.searchCharater(searchValue);
    setState(() {
      characterList = searchingList;
    });
  }

  void searchCreator(String searchValue) async{
    List<Creator> searchingList = [];
    searchingList = await CreatorController.searchCreator(searchValue);
    setState(() {
      creatorList = searchingList;
    });
  }

  @override
  Widget build(BuildContext context) {
    setFocus();
    switch(searchType){
      case ObjectsTypeMarvel.COMICS:
        return searchingComic(context);
        break;
      case ObjectsTypeMarvel.CHARACTERS:
        return searchingCharacter(context);
      case ObjectsTypeMarvel.CREATORS:
        return searchingCreator(context);
      break;
    }
  }

  Scaffold searchingComic(BuildContext context) {
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
                    focusNode: focusDestination,
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

  Scaffold searchingCharacter(BuildContext context) {
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
                      focusNode: focusDestination,
                      controller: searchField,
                      onChanged: (value) => searchCharacter(value),
                      decoration: InputDecoration(
                          hintText: 'Search a character',
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
                  child: ListView.separated(itemBuilder: (context, index) => CharactersTile(character: characterList[index], index: index,), separatorBuilder: (context, index) => SizedBox(height: 10,), itemCount: characterList.length),

                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Scaffold searchingCreator(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Find a creator',
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
                      focusNode: focusDestination,
                      controller: searchField,
                      onChanged: (value) => searchCreator(value),
                      decoration: InputDecoration(
                          hintText: 'Search a creator',
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
