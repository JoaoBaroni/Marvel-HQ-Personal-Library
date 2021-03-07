import 'package:flutter/material.dart';
import 'package:hq_personal_library/components/default_card_comic.dart';
import 'package:hq_personal_library/model/creator.dart';
import 'package:hq_personal_library/utils/colors.dart';

class CreatorsDetailPage extends StatefulWidget {
  final Creator creator;

  CreatorsDetailPage({this.creator});

  @override
  _CreatorsDetailPageState createState() => _CreatorsDetailPageState(creator: creator);
}

class _CreatorsDetailPageState extends State<CreatorsDetailPage> {
  final Creator creator;

  _CreatorsDetailPageState({this.creator});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            Icons.arrow_back,
            color: kSecondaryColor,
          ),
        ),
        backgroundColor: kPrimaryColor,
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              decoration:  BoxDecoration(
                  color: kPrimaryColor,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black26,
                        blurRadius: 3.0,
                        spreadRadius: 0.5,
                        offset: Offset(0.7, 0.7))
                  ]),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 50,
                  ),
                  Text(
                    'Name here',
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
                  )
                ],
              ),
            ),
            flex: 1,
          ),
          Expanded(
              child: Container(
                child: Column(
                  children: [
                    Text('Name here comics'),
                    ListView.separated(
                        primary: false,
                        shrinkWrap: true,
                        itemBuilder: (context, index) =>
                            DefaultCardComic(
                              comic: creator.comics[index],
                              index: index,
                            ),
                        separatorBuilder: (context, index) => SizedBox(height: 20,),
                        itemCount: creator.comics.length)
                  ],
                ),
              ),
              flex: 4),
        ],
      ),
    );
  }
}
