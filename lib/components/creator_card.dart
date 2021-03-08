import 'package:flutter/material.dart';
import 'package:hq_personal_library/model/creator.dart';
import 'package:hq_personal_library/screen/creators_detail_page.dart';
import 'package:hq_personal_library/utils/colors.dart';


class CreatorCard extends StatelessWidget {
  final Creator creator;

  CreatorCard({this.creator});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: GestureDetector(
        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => CreatorsDetailPage(creator: creator,),)),
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
