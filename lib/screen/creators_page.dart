import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:hq_personal_library/components/banner_widget.dart';
import 'package:hq_personal_library/components/creator_card.dart';
import 'package:hq_personal_library/components/default_card_comic.dart';
import 'package:hq_personal_library/controller/comics.dart';
import 'package:hq_personal_library/controller/creators.dart';
import 'package:hq_personal_library/helper/helper_methods.dart';
import 'package:hq_personal_library/model/character.dart';
import 'package:hq_personal_library/model/creator.dart';
import 'package:hq_personal_library/screen/characters_detail_page.dart';
import 'package:hq_personal_library/screen/creators_detail_page.dart';
import 'package:hq_personal_library/screen/search_page.dart';
import 'package:hq_personal_library/utils/colors.dart';
import 'package:hq_personal_library/utils/typesEnum.dart';
import 'package:lottie/lottie.dart';

class CreatorsPage extends StatefulWidget {
  @override
  _CreatorsPageState createState() => _CreatorsPageState();
}

class _CreatorsPageState extends State<CreatorsPage> {
  List<Creator> creatorsList = [];

  void getCreators() async {
    List<Creator> creatorsFound = await CreatorController.fetchAllCreators();

    if (creatorsFound.isNotEmpty) {
      setState(() {
        creatorsList = creatorsFound;
      });
    }
  }

  @override
  void initState() {
    getCreators();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () => SearchPage(searchType: ObjectsTypeMarvel.CREATORS,),
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
              child: Row(
                children: [
                  Icon(Icons.search, color: kAccentColor),
                  SizedBox(
                    width: 10,
                  ),
                  Text('Search a creator')
                ],
              ),
            ),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(4),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black12,
                      blurRadius: 5.0,
                      spreadRadius: 0.5,
                      offset: Offset(0.7, 0.7))
                ]),
          ),
        ),
        SizedBox(height: 20,),
        Expanded(
          child: Container(
            child: ListView.separated(
                itemBuilder: (context, index) => CreatorCard(
                      creator: creatorsList[index],
                    ),
                separatorBuilder: (context, index) => SizedBox(height: 20,),
                itemCount: creatorsList.length),
          ),
        ),
      ],
    );
  }
}
