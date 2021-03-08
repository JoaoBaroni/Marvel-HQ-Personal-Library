import 'package:hq_personal_library/helper/request_helper.dart';
import 'package:hq_personal_library/model/character.dart';
import 'package:hq_personal_library/model/comic.dart';
import 'package:hq_personal_library/utils/api.dart';
import 'package:hq_personal_library/utils/utils.dart';

class CharacterController {

  static Future<dynamic> fetchAllCharacters() async {
    var timestamp = DateTime.now().millisecondsSinceEpoch.toString();
    String hash = Utils.generateHash(timestamp);
    var response = await RequestHelper.getRequest('${API_PATH}v1/public/characters?ts=${timestamp}&apikey=${PUBLIC_KEY}&hash=${hash}');

    if (response == 'error') {
      return;
    } else {
      List<Character> list = [];
      response['data']['results'].forEach((e) => list.add(Character.fromJson(e)));
      list.forEach((element) async => await element.checkAvaibleComics());
      return list;
    }
  }

  static Future<dynamic> fetchSpecificCharacter(String characterID) async {
    var timestamp = DateTime.now().millisecondsSinceEpoch.toString();
    String hash = Utils.generateHash(timestamp);
    var response = await RequestHelper.getRequest('${API_PATH}v1/public/characters/${characterID}?ts=${timestamp}&apikey=${PUBLIC_KEY}&hash=${hash}');

    if (response == 'error') {
      return;
    } else {
      List<Comic> list = [];
      response['data']['results'].forEach((e) => list.add(Comic.fromJson(e)));
      list.forEach((element) async => await element.verifiyCharacters());
      return list;
    }
  }

  static Future<List<Character>> fetchCharactersByProvidedURL(List<String> url) async {
    List<Character> listWillBeReturned = [];

    url.forEach((element) async {
      var timestamp = DateTime.now().millisecondsSinceEpoch.toString();
      String hash = Utils.generateHash(timestamp);
      var response = await RequestHelper.getRequest('${element}?ts=${timestamp}&apikey=${PUBLIC_KEY}&hash=${hash}');

      if (response == 'error') {
        print('error');
      } else {
        Character character = Character.fromJson(response['data']['results'][0]);
        if (character != null) {
          listWillBeReturned.add(character);
        }
      }
    });
    return listWillBeReturned;
  }

  static Future<List<Character>> searchCharater(String query) async {
    var timestamp = DateTime.now().millisecondsSinceEpoch.toString();
    String hash = Utils.generateHash(timestamp);
    var response = await RequestHelper.getRequest('${API_PATH}v1/public/characters?nameStartsWith=${query}&ts=${timestamp}&apikey=${PUBLIC_KEY}&hash=${hash}');

    if (response == 'error') {
      return [];
    } else {
      List<Character> list = [];
      response['data']['results'].forEach((e) => list.add(Character.fromJson(e)));
      list.forEach((element) async => await element.checkAvaibleComics());
      return list;
    }
  }


}