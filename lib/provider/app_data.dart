import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hq_personal_library/model/comic.dart';
import 'package:hq_personal_library/model/personal_list.dart';

class AppData extends ChangeNotifier{
  List<Comic> favoriteComics = [];
  List<PersonalList> personalLists = [];

  void addNewComicToFavorite(Comic comic){
    if(!favoriteComics.any((element) => element.id == comic.id)) {
      favoriteComics.add(comic);
    }
    notifyListeners();
  }

  void removeComicFromFavorite(Comic comic){
    if(favoriteComics.any((element) => element.id == comic.id)){
      favoriteComics.removeWhere((element) => element.id == comic.id);
    }
    notifyListeners();
  }

  bool isComicInFavoriteList(Comic comic){
    return favoriteComics.any((element) => element.id == comic.id);
  }

}