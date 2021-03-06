import 'comic.dart';

class Creator{
  String firstName;
  int id;
  String lastName;
  String fullName;
  List<Comic> comics;
  String thumbNail;

  Creator({this.id, this.comics, this.firstName, this.fullName, this.lastName, this.thumbNail});

}