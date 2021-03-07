import 'package:flutter/material.dart';
import 'package:hq_personal_library/components/banner_widget.dart';
import 'package:hq_personal_library/components/default_card_comic.dart';
import 'package:hq_personal_library/controller/characters.dart';
import 'package:hq_personal_library/helper/helper_methods.dart';
import 'package:hq_personal_library/model/character.dart';
import 'package:hq_personal_library/screen/characters_detail_page.dart';
import 'package:hq_personal_library/utils/colors.dart';
import 'package:lottie/lottie.dart';

class CharacterPage extends StatefulWidget {
  @override
  _CharacterPageState createState() => _CharacterPageState();
}

class _CharacterPageState extends State<CharacterPage> {
  List<Character> characterList = [];

  void getCharaters() async {
    List<Character> charactersFound = await CharacterController.fetchAllCharacters();

    if (charactersFound.isNotEmpty) {
      setState(() {
        characterList = charactersFound;
      });
    }
  }

  @override
  void initState() {
    getCharaters();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
            child: Row(
              children: [
                Icon(Icons.search, color: kAccentColor),
                SizedBox(
                  width: 10,
                ),
                Text('Search a character')
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
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Container(
              child: characterList.length > 0  ? ListView.separated(
                  itemBuilder: (context, index) => CharactersTile(
                        index: index,
                        character: characterList[index],
                      ),
                  separatorBuilder: (context, index) => SizedBox(
                        height: 10,
                      ),
                  itemCount: characterList.length) : Lottie.asset('images/newLoading.json', height: 100, width: 100),
            ),
          ),
        ),
      ],
    );
  }
}

class CharactersTile extends StatelessWidget {
  final Character character;
  final int index;

  CharactersTile({this.character, this.index});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => CharactersDetailPage(character: character,),)),
      child: Container(
        height: 170,
        child: Row(
          children: [
            Expanded(
              child: Container(
                child: BannerWidget(
                  index: index,
                  imagePath: character.thumbnail.fullPath,
                  showFavorite: false,
                  isFavorited: false,
                ),
              ),
            ),
            SizedBox(
              width: 20,
            ),
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    character.name ?? 'Name not avaible',
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 15),
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    'Editions avaible: ' + character.avaibleComics.toString(),
                    style: TextStyle(fontWeight: FontWeight.w200, fontSize: 15),
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
      ),
    );
  }
}
