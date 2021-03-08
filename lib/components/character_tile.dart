import 'package:flutter/material.dart';
import 'package:hq_personal_library/model/character.dart';
import 'package:hq_personal_library/screen/characters_detail_page.dart';

import 'banner_widget.dart';


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
