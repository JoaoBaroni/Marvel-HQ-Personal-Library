import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hq_personal_library/controller/characters.dart';
import 'package:hq_personal_library/controller/comics.dart';
import 'package:hq_personal_library/helper/helper_methods.dart';
import 'package:hq_personal_library/model/character.dart';
import 'package:hq_personal_library/model/creator.dart';
import 'package:hq_personal_library/model/thumbnail.dart';
import 'package:hq_personal_library/utils/typesEnum.dart';

class Comic {
  int id;
  String description;
  String title;
  String isbn;
  int pageCount;
  Thumbnail thumbnail;
  String serie;
  List<Thumbnail> galeryImages;
  List<String> creator;
  List<String> charactersEndPoints;
  List<Character> charactersList;

  Comic(
      {this.id,
      this.title,
      this.description,
      this.galeryImages,
      this.isbn,
      this.creator,
      this.pageCount,
      this.charactersList,
      this.thumbnail});

  Future<void> verifiyCharacters() async{
    if(charactersEndPoints != null){
      charactersList = await CharacterController.fetchCharactersByProvidedURL(charactersEndPoints);
    }

  }

  Comic.fromJson(Map<String, dynamic> json){
    id = json['id'];
    description = json['description'];
    title = json['title'];
    isbn = json['isbn'];
    pageCount = json['pageCount'];
    thumbnail = Thumbnail(
        extension: json['thumbnail']['extension'],
        path: json['thumbnail']['path']);
    serie = json['series']['name'];
    if(json['characters']['available'] != 0){
      List<String> list = [];
      json['characters']['items'].forEach((e) => list.add(e['resourceURI']));
      charactersEndPoints = list;
    }
    if(json['creators']['items'] != null){
      creator = [];
      json['creators']['items'].forEach((e) => creator.add(e['name']));
    }
  }
}
