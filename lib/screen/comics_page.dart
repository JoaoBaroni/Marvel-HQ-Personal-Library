import 'package:flutter/material.dart';
import 'package:hq_personal_library/components/default_card_comic.dart';
import 'package:hq_personal_library/controller/comics.dart';
import 'package:hq_personal_library/model/comic.dart';
import 'package:hq_personal_library/screen/search_page.dart';
import 'package:hq_personal_library/utils/colors.dart';
import 'package:lottie/lottie.dart';

class ComicsPage extends StatefulWidget {
  @override
  _ComicsPageState createState() => _ComicsPageState();
}

class _ComicsPageState extends State<ComicsPage> {
  List<Comic> comicsList = [];

  void getComics() async {
    List<Comic> comicsFound = await ComicsController.fetchAllComics();

    if (comicsFound.isNotEmpty) {
      setState(() {
        comicsList = comicsFound;
      });
    }
  }

  @override
  void initState() {
    getComics();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SearchPage(),
              )),
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
              child: Row(
                children: [
                  Icon(Icons.search, color: kAccentColor),
                  SizedBox(
                    width: 10,
                  ),
                  Text('Search a comic')
                ],
              ),
            ),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(4),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black12,
                      blurRadius: 5.0,
                      spreadRadius: 0.5,
                      offset: Offset(0.7, 0.7))
                ]),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Container(
              child: comicsList.length > 0
                  ? ListView.separated(
                      separatorBuilder: (context, index) => SizedBox(
                        height: 10,
                      ),
                      itemBuilder: (context, index) => DefaultCardComic(
                        index: index,
                        comic: comicsList[index],
                      ),
                      itemCount: comicsList.length,
                    )
                  : Lottie.asset('images/newLoading.json', height: 100, width: 100)
            ),
          ),
        ),
      ],
    );
  }
}
