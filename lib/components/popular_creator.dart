import 'package:flutter/material.dart';

import 'banner_widget.dart';

class PopularCreator extends StatelessWidget {
  const PopularCreator({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          child: Container(
            height: 170,
            child: BannerWidget(),
          ),
          flex: 1,
        ),
        Expanded(
          flex: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Iron Man',
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 15),
              ),
              Text(
                'Morgan Stark',
                style: TextStyle(fontWeight: FontWeight.w200, fontSize: 15),
              ),
              Text(
                'Saga XXXX',
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 15),
              )
            ],
          ),
        ),
      ],
    );
  }
}

