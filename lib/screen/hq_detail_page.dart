import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hq_personal_library/components/creator_card.dart';
import 'package:hq_personal_library/components/popular_creator.dart';
import 'package:hq_personal_library/components/suggest_item.dart';
import 'package:hq_personal_library/model/character.dart';
import 'package:hq_personal_library/model/comic.dart';
import 'package:hq_personal_library/utils/api.dart';
import 'package:hq_personal_library/utils/colors.dart';

class HQDetailPage extends StatefulWidget {
  static String id = 'HQDetailPage';
  final int index;
  final Comic comic;

  HQDetailPage({this.index, this.comic});

  @override
  _HQDetailPageState createState() => _HQDetailPageState(index: index, comic: comic);
}

class _HQDetailPageState extends State<HQDetailPage>
    with TickerProviderStateMixin {
  final int index;
  double bottomSheetHeight = 0;
  final Comic comic;

  List<Widget> tabs = [
    Tab(
      text: 'About',
    ),
    Tab(
      text: 'Characters',
    ),
    Tab(
      text: 'Aditional Informations',
    ),
  ];


  _HQDetailPageState({this.index, this.comic});

  @override
  void initState() {
    super.initState();
    bottomSheetHeight = 400;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Hero(
            tag: 'image${index}',
            child: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(comic.thumbnail.fullPath),
                      fit: BoxFit.fill)),
            ),
          ),
          Positioned(
            child: IconButton(
              icon: Icon(Icons.arrow_back, color: kPrimaryColor),
              onPressed: () => Navigator.pop(context),
            ),
            top: 40,
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 700,
              child: DraggableScrollableSheet(
                builder: (context, scrollController) {
                  return Container(
                    child: ListView(
                      controller: scrollController,
                      children: [
                        Container(
                          height: 700,
                          decoration: BoxDecoration(
                              color: kPrimaryColor,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(15),
                                  topRight: Radius.circular(15)),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black26,
                                    blurRadius: 15.0,
                                    spreadRadius: 0.5,
                                    offset: Offset(0.7, 0.7))
                              ]),
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 15),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      child: Container(
                                        child: Text(comic.title,
                                            textAlign: TextAlign.justify,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                fontWeight: FontWeight.w700,
                                                fontSize: 20)),
                                      ),
                                    ),

                                    IconButton(
                                      icon: Icon(
                                        Icons.favorite_border,
                                        size: 20,
                                      ),
                                      onPressed: () => null,
                                    ),
                                  ],
                                ),
                                Container(
                                  child: Column(
                                    children: [
                                      Text(comic.description, textAlign: TextAlign.justify,),
                                      SizedBox(height: 10,),
                                      Text('Serie: ${comic.serie ?? 'Not found'}'),
                                      Text('ISBN: ${comic.isbn} '),
                                      Text('Pages: ${comic.pageCount.toString()} '),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  'Characters',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 20),
                                ),
                                SizedBox(
                                  height: comic.charactersList != null ? 20 : 10,
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                        child: Container(
                                            height: comic.charactersList != null ? 150 : 20,
                                            child: comic.charactersList != null ? ListView.builder(
                                              itemBuilder: (context, index) =>
                                                  CharacterIcon(character: comic.charactersList[index],),
                                              itemCount: comic.charactersList.length,
                                              scrollDirection: Axis.horizontal,
                                            ): Center(child: Text('No characters found'))))
                                  ],
                                ),
                                Text(
                                  'Created by Stan Lee',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 20),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
                initialChildSize: 0.5,
                maxChildSize: 1,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CharacterIcon extends StatelessWidget {
  final Character character;

  CharacterIcon({this.character});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        child: Column(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(character.thumbnail.fullPath),
              radius: 40,
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              character.name,
              style: TextStyle(fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
