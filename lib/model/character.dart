import 'package:flutter/material.dart';
import 'package:hq_personal_library/model/thumbnail.dart';

import 'comic.dart';

class Character{
  int id;
  int avaibleComics;
  String name;
  String description;
  Thumbnail thumbnail;
  List<Comic> comics;

  Character({this.comics, this.id, this.thumbnail, this.description, this.name});

  Character.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
    description = json['description'];
    thumbnail = Thumbnail(path: json['thumbnail']['path'], extension: json['thumbnail']['extension']);
    avaibleComics = json['comics']['available'];
  }

}