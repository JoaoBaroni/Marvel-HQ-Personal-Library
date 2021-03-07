import 'package:hq_personal_library/controller/comics.dart';
import 'package:hq_personal_library/helper/helper_methods.dart';
import 'package:hq_personal_library/model/thumbnail.dart';

import 'comic.dart';

class Creator{
  int id;
  String firstName;
  String fullName;
  List<Comic> comics;
  Thumbnail thumbNail;
  List<String> comicsUri;
  int comicsAvaible;


  Creator({this.id, this.comics, this.fullName, this.thumbNail});

  Future<void> verifyComics() async{
    if(comicsUri != null){
      comics = [];
      comics = await ComicsController.fetchComicsByProvidedURL(comicsUri);
    }
  }

  Creator.fromJson(Map<String, dynamic> json){
    id = json['id'];
    firstName = json['firstName'];
    fullName = json['fullName'];
    thumbNail = Thumbnail(extension: json['thumbnail']['extension'], path: json['thumbnail']['path']);
    if(json['comics']['items'] != null){
      comicsUri = [];
      json['comics']['items'].forEach((e) => comicsUri.add(e['resourceURI']));
    }

  }

}