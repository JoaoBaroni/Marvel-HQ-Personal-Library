import 'package:hq_personal_library/model/creator.dart';

class Comic {
  int id;
  String description;
  String title;
  String isbn;
  int pageCount;
  String thumbnail;
  List<String> galerryImages;
  Creator creator;

  Comic({this.id, this.title, this.description, this.galerryImages, this.isbn, this.creator, this.pageCount, this.thumbnail});

}