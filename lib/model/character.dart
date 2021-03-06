import 'comic.dart';

class Character{
  int id;
  String name;
  String description;
  String thumbnail;
  List<Comic> comics;

  Character({this.comics, this.id, this.thumbnail, this.description, this.name});

}