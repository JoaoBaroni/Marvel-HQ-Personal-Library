import 'package:flutter/material.dart';
import 'package:hq_personal_library/components/creator_card.dart';
import 'package:hq_personal_library/components/suggest_item.dart';
import 'package:hq_personal_library/controller/comics.dart';
import 'package:hq_personal_library/helper/helper_methods.dart';
import 'package:hq_personal_library/provider/app_data.dart';
import 'package:hq_personal_library/utils/colors.dart';
import 'package:provider/provider.dart';


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
    ComicsController.fetchAllComics();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
            color: kAccentColor,
            height: MediaQuery.of(context).size.height * 0.33,
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Your favorite comics', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700),),
                  SizedBox(height: 15),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.25,
                    child: Provider.of<AppData>(context, listen: true).favoriteComics.length > 0 ?ListView.builder(
                        itemBuilder: (context, index) =>
                            Row(children: [SuggestItem(index: index, comic: Provider.of<AppData>(context, listen: true).favoriteComics[index],)]),
                        itemCount: Provider.of<AppData>(context, listen: true).favoriteComics.length,
                        scrollDirection: Axis.horizontal) : Center(child: Text('Mark your favorites comics then we\'ll show them here :)', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700), textAlign: TextAlign.center,),),
                  ),
                ],
              ),
            ),
          ),


        ],
      ),
    );
  }
}
