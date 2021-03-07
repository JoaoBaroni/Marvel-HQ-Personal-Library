import 'package:flutter/material.dart';
import 'package:hq_personal_library/model/comic.dart';
import 'package:hq_personal_library/screen/hq_detail_page.dart';

import 'banner_widget.dart';


class SuggestItem extends StatelessWidget {
  final String name;
  final bool isFavorite;
  final Function callBack;
  final String imagePath;
  final int index;
  final Comic comic;

  SuggestItem({this.imagePath, this.callBack, this.name, this.isFavorite, this.index, this.comic});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: callBack ?? () => Navigator.push(context, MaterialPageRoute(builder: (context) => HQDetailPage(index: index, comic: comic,),)),
      child: Padding(
        padding:
        EdgeInsets.only(right: MediaQuery.of(context).size.width * 0.035),
        child: Container(
          width: MediaQuery.of(context).size.width * 0.3,
          child: Column(
            children: [
              BannerWidget(imagePath: comic.thumbnail.fullPath, index: index, comic: comic, isFavorited: true, showFavorite: false,),
              SizedBox(
                height: 4,
              ),
              Hero(
                tag: 'title${index}',
                child: Text(
                  comic.title,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
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
