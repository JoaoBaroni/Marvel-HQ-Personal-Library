import 'package:flutter/material.dart';
import 'package:hq_personal_library/utils/api.dart';
import 'package:hq_personal_library/utils/colors.dart';

class HQDetailPage extends StatefulWidget {
  static String id = 'HQDetailPage';
  final int index;

  HQDetailPage({this.index});

  @override
  _HQDetailPageState createState() => _HQDetailPageState(index: index);
}

class _HQDetailPageState extends State<HQDetailPage> with TickerProviderStateMixin {
  final int index;
  double bottomSheetHeight = 0;

  _HQDetailPageState({this.index});

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
                      image: AssetImage('images/example_image.jpg'),
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
              height: 500,
              child: DraggableScrollableSheet(builder: (context, scrollController) {
                return Container(
                  child: ListView(
                    controller: scrollController,
                    children: [
                      Container(
                        height: 500,
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
                                  Text('Iron Man',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w700, fontSize: 30)),
                                  Expanded(child: Container(),),
                                  IconButton(icon: Icon(Icons.favorite_border, size: 20,), onPressed: () => null,),
                                ],
                              ),
                              Container(
                                child: Text(LOREM_IPSUM),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
              initialChildSize: 0.5, maxChildSize: 1,),
            ),
          ),
        ],
      ),
    );
  }
}
