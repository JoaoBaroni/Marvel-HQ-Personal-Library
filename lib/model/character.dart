import 'package:flutter/material.dart';
import 'package:hq_personal_library/controller/comics.dart';
import 'package:hq_personal_library/helper/helper_methods.dart';
import 'package:hq_personal_library/model/thumbnail.dart';
import 'package:hq_personal_library/utils/typesEnum.dart';

import 'comic.dart';

class Character{
  int id;
  int avaibleComics;
  String name;
  String description;
  Thumbnail thumbnail;
  List<Comic> comics;
  List<String> comicsUri;

  Character({this.comics, this.id, this.thumbnail, this.description, this.name});

  Future<void> checkAvaibleComics() async{
    if(comicsUri != null){
      comics = [];
      comics = await ComicsController.fetchComicsByProvidedURL(comicsUri);

    }
  }

  Character.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
    description = json['description'];
    thumbnail = Thumbnail(path: json['thumbnail']['path'], extension: json['thumbnail']['extension']);
    avaibleComics = json['comics']['available'];
    if(json['comics']['items'] != null){
      comicsUri = [];
      json['comics']['items'].forEach((comicFounded) => comicsUri.add(comicFounded['resourceURI']));
    }

  }

}