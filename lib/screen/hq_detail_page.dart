import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hq_personal_library/components/creator_card.dart';
import 'package:hq_personal_library/components/default_card_comic.dart';
import 'package:hq_personal_library/components/suggest_item.dart';
import 'package:hq_personal_library/model/character.dart';
import 'package:hq_personal_library/model/comic.dart';
import 'package:hq_personal_library/utils/api.dart';
import 'package:hq_personal_library/utils/colors.dart';

class HQDetailPage extends StatefulWidget {
  static String id = 'HQDetailPage';
  final int index;
  final Comic comic;

  HQDetailPage({this.index, this.comic});

  @override
  _HQDetailPageState createState() =>
      _HQDetailPageState(index: index, comic: comic);
}

class _HQDetailPageState extends State<HQDetailPage>
    with TickerProviderStateMixin {
  final int index;
  double bottomSheetHeight = 0;
  final Comic comic;
  var hasCharactersFound;

  _HQDetailPageState({this.index, this.comic});

  @override
  void initState() {
    super.initState();
    bottomSheetHeight = 400;
    hasCharactersFound = comic.charactersList != null;
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
                      image: NetworkImage(comic.thumbnail.fullPath),
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
              height: 700,
              child: DraggableScrollableSheet(
                builder: (context, scrollController) {
                  return Container(
                    child: ListView(
                      controller: scrollController,
                      children: [
                        contentPage(),
                      ],
                    ),
                  );
                },
                initialChildSize: 0.5,
                maxChildSize: 1,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container contentPage() {
    return Container(
      height: 700,
      decoration: BoxDecoration(
          color: kPrimaryColor,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15), topRight: Radius.circular(15)),
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
            headerPage(),
            mainInformations(),
            SizedBox(
              height: 20,
            ),
            hasCharactersFound ? charactersInformations() : SizedBox(height: 10,),
          ],
        ),
      ),
    );
  }



  Container charactersInformations() {
    return Container(
            child: Column(
              children: [Text(
                'Characters',
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
              ),
                SizedBox(
                  height: comic.charactersList != null ? 20 : 10,
                ),
                charactersListView(),
            ]),
          );
  }

  Row headerPage() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Container(
            child: Text(comic.title ?? 'Not found',
                textAlign: TextAlign.justify,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20)),
          ),
        ),
      ],
    );
  }

  Row charactersListView() {
    return Row(
      children: [
        Expanded(
            child: Container(
                height: comic.charactersList != null ? 150 : 20,
                child: comic.charactersList != null
                    ? ListView.builder(
                        itemBuilder: (context, index) => CharacterIcon(
                          character: comic.charactersList[index],
                        ),
                        itemCount: comic.charactersList.length,
                        scrollDirection: Axis.horizontal,
                      )
                    : Center(child: Text('No characters was found'))))
      ],
    );
  }

  Container mainInformations() {
    return Container(
      child: Column(
        children: [
          Text(
            comic.description ?? 'Description information not provided by API',
            textAlign: TextAlign.justify,
          ),
          SizedBox(
            height: 10,
          ),
          Text('Serie: ${comic.serie ?? 'Not found'}'),
          Text('ISBN: ${comic.isbn ?? 'Information not provided by API'} '),
          Text('Pages: ${comic.pageCount.toString() ?? '0'} '),
        ],
      ),
    );
  }
}

class CharacterIcon extends StatelessWidget {
  final Character character;

  CharacterIcon({this.character});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        child: Column(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(character.thumbnail.fullPath),
              radius: 40,
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              character.name,
              style: TextStyle(fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
