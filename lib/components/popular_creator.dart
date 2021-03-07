import 'package:flutter/material.dart';
import 'package:hq_personal_library/model/comic.dart';
import 'package:hq_personal_library/screen/hq_detail_page.dart';
import 'package:hq_personal_library/utils/colors.dart';

import 'banner_widget.dart';

class PopularCreator extends StatelessWidget {

  final Comic comic;
  final int index;

  PopularCreator({this.comic, this.index});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      highlightColor: kAccentColor,
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => HQDetailPage(index: index, comic: comic,),)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              height: 170,
              child: BannerWidget(index: index, imagePath: comic != null ? comic.thumbnail.fullPath : null,),
            ),
            flex: 1,
          ),
          SizedBox(width: 10,),
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  comic.title ?? 'Title',
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 15),
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  'Creator',
                  style: TextStyle(fontWeight: FontWeight.w200, fontSize: 15),
                ),
                Text(
                  comic.serie ?? 'Serie not provided',
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 15),
                ),
                Text(
                  'No List Found',
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 15),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

