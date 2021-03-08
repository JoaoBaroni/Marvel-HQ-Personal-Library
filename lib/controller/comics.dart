import 'package:hq_personal_library/helper/request_helper.dart';
import 'package:hq_personal_library/model/comic.dart';
import 'package:hq_personal_library/utils/api.dart';
import 'package:hq_personal_library/utils/utils.dart';

class ComicsController {

  static Future<dynamic> fetchAllComics() async {
    var timestamp = DateTime.now().millisecondsSinceEpoch.toString();
    String hash = Utils.generateHash(timestamp);
    var response = await RequestHelper.getRequest('${API_PATH}v1/public/comics?ts=${timestamp}&apikey=${PUBLIC_KEY}&hash=${hash}');

    if (response == 'error') {
      return;
    } else {
      List<Comic> list = [];
      response['data']['results'].forEach((e) => list.add(Comic.fromJson(e)));
      list.forEach((element) async => await element.verifiyCharacters());
      return list;
    }
  }

  static Future<List<Comic>> fetchComicsByProvidedURL(List<String> url) async {
    List<Comic> listWillBeReturned = [];
    url.forEach((element) async {
      var timestamp = DateTime.now().millisecondsSinceEpoch.toString();
      String hash = Utils.generateHash(timestamp);
      var response = await RequestHelper.getRequest('${element}?ts=${timestamp}&apikey=${PUBLIC_KEY}&hash=${hash}');

      if (response == 'error') {
        print('error');
      } else {
        Comic comic = Comic.fromJson(response['data']['results'][0]);
        if (comic != null) {
          listWillBeReturned.add(comic);
        }
      }
    });

    return listWillBeReturned;
  }


  static Future<List<Comic>> searchHQ(String query) async {
    var timestamp = DateTime.now().millisecondsSinceEpoch.toString();
    String hash = Utils.generateHash(timestamp);
    var response = await RequestHelper.getRequest('${API_PATH}v1/public/comics?title=${query}&ts=${timestamp}&apikey=${PUBLIC_KEY}&hash=${hash}');

    if (response == 'error') {
      return [];
    } else {
      List<Comic> list = [];
      response['data']['results'].forEach((e) => list.add(Comic.fromJson(e)));
      //list.forEach((element) async => await element.verifiyCharacters());
      return list;
    }
  }



}