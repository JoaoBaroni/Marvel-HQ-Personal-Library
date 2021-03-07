import 'package:flutter/material.dart';
import 'package:hq_personal_library/components/default_card_comic.dart';
import 'package:hq_personal_library/model/character.dart';
import 'package:hq_personal_library/utils/api.dart';
import 'package:hq_personal_library/utils/colors.dart';
import 'package:lottie/lottie.dart';

class CharactersDetailPage extends StatefulWidget {
  final Character character;

  CharactersDetailPage({this.character});

  @override
  _CharactersDetailPageState createState() =>
      _CharactersDetailPageState(character: character);
}

class _CharactersDetailPageState extends State<CharactersDetailPage>
    with TickerProviderStateMixin {
  List<Widget> tabs = [
    Tab(
      text: 'About',
    ),
    Tab(
      text: 'Comics',
    ),
  ];

  final Character character;
  _CharactersDetailPageState({this.character});
  TabController _tabController;


  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: tabs.length, vsync: this);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kPrimaryColor,
        appBar: AppBar(
          backgroundColor: kAccentColor,
          elevation: 0,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: kPrimaryColor,
            ),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        body: Column(
          children: [
            buildHeader(),
            Expanded(
              flex: 3,
              child: Container(
                child: Column(
                  children: [
                    TabBar(
                      tabs: tabs,
                      controller: _tabController,
                      labelColor: kSecondaryColor,
                      unselectedLabelColor: Colors.black,
                      indicatorSize: TabBarIndicatorSize.tab,
                    ),
                    Expanded(
                      child: TabBarView(
                        children: [
                          SingleChildScrollView(
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 20),
                              child: Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Description',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w700),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      character.description ??
                                          'Information not provided by API',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w200),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SingleChildScrollView(
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 20),
                              child: Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Comics with ${character.name}',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w700),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    ListView.separated(
                                      primary: false,
                                        shrinkWrap: true,
                                        itemBuilder: (context, index) =>
                                            DefaultCardComic(
                                              comic: character.comics[index],
                                              index: index,
                                            ),
                                        separatorBuilder: (context, index) => SizedBox(height: 20,),
                                        itemCount: character.comics.length)
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                        controller: _tabController,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
  }

  Expanded buildHeader() {
    return Expanded(
      child: Container(
        color: kAccentColor,
        width: double.infinity,
        child: Column(
          children: [
            CircleAvatar(
              radius: 60,
              backgroundImage: NetworkImage(character.thumbnail.fullPath),
            ),
            SizedBox(height: 20,),
            Text(
              character.name,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20, color: kPrimaryColor),
            )
          ],
        ),
      ),
    );
  }
}
