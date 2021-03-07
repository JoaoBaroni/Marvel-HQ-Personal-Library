import 'package:flutter/material.dart';
import 'package:hq_personal_library/components/creator_card.dart';
import 'package:hq_personal_library/components/suggest_item.dart';
import 'package:hq_personal_library/helper/helper_methods.dart';


class OverviewPage extends StatefulWidget {

  OverviewPage();

  @override
  _OverviewPageState createState() => _OverviewPageState();
}

class _OverviewPageState extends State<OverviewPage> {
  List<int> numberTeste = [0, 1, 2, 3];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    HelperMethods.getAllHQ(context);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 30),
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hello, Admin',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                        fontSize: 25),
                  ),
                  Text(
                    'Book your favorites HQ',
                    style: TextStyle(fontStyle: FontStyle.italic),
                  )
                ],
              ),
            ),
          ),
          Container(
            height: 300,
            child: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: SizedBox(
                  height: 300,
                  child: ListView.builder(
                      itemBuilder: (context, index) =>
                          Row(children: [SuggestItem(index: index,)]),
                      itemCount: numberTeste.length,
                      scrollDirection: Axis.horizontal),
                )),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      'Popular Creators',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                          fontSize: 20),
                    ),
                    Expanded(
                      child: Container(),
                    ),
                    FlatButton(onPressed: () => null, child: Text('See more'))
                  ],
                ),
                Column(
                  children: [
                    SizedBox(
                      height: 100,
                      child: ListView.builder(
                          itemBuilder: (context, index) =>
                              Row(children: [CreatorCard()]),
                          itemCount: numberTeste.length,
                          scrollDirection: Axis.horizontal),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
