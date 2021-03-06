import 'package:flutter/material.dart';
import 'package:hq_personal_library/screen/hq_detail_page.dart';

import 'banner_widget.dart';


class SuggestItem extends StatelessWidget {
  final String name;
  final bool isFavorite;
  final Function callBack;
  final String imagePath;
  final int index;

  SuggestItem({this.imagePath, this.callBack, this.name, this.isFavorite, this.index});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: callBack ?? () => Navigator.push(context, MaterialPageRoute(builder: (context) => HQDetailPage(index: index ?? 0,),)),
      child: Padding(
        padding:
        EdgeInsets.only(right: MediaQuery.of(context).size.width * 0.04),
        child: Container(
          width: MediaQuery.of(context).size.width * 0.4,
          child: Column(
            children: [
              BannerWidget(imagePath: imagePath, index: index,),
              SizedBox(
                height: 4,
              ),
              Hero(
                tag: 'title${index}',
                child: Text(
                  name ?? 'Iron Man',
                  style: TextStyle(fontWeight: FontWeight.w700),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
