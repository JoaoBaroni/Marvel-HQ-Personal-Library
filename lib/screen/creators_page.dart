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
import 'package:hq_personal_library/utils/colors.dart';
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
        Container(
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

class CreatorCard extends StatelessWidget {
  final Creator creator;

  CreatorCard({this.creator});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: GestureDetector(
        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => CreatorsDetailPage(),)),
        child: Container(
          height: 125,
          decoration: BoxDecoration(
              color: kPrimaryColor,
              borderRadius: BorderRadius.all(Radius.circular(10)),
              boxShadow: [
                BoxShadow(
                    color: Colors.black26,
                    blurRadius: 3.0,
                    spreadRadius: 0.5,
                    offset: Offset(0.7, 0.7))
              ]),
          child: Row(
            children: [
              Expanded(
                  child: CircleAvatar(
                radius: 45,
                      backgroundImage: NetworkImage(creator.thumbNail.fullPath),
              )),
              Expanded(
                flex: 2,
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        creator.fullName ?? 'Not found',
                        style: TextStyle(fontWeight: FontWeight.w700),
                      ),
                      Text('${creator.comicsAvaible ?? '0'}  comics'),
                      Text('Comics saved'),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
