import 'package:hq_personal_library/helper/request_helper.dart';
import 'package:hq_personal_library/model/creator.dart';
import 'package:hq_personal_library/utils/api.dart';
import 'package:hq_personal_library/utils/utils.dart';

class CreatorController {

  static Future<dynamic> fetchAllCreators() async {
    var timestamp = DateTime.now().millisecondsSinceEpoch.toString();
    String hash = Utils.generateHash(timestamp);
    var response = await RequestHelper.getRequest('${API_PATH}v1/public/creators?orderBy=middleName&ts=${timestamp}&apikey=${PUBLIC_KEY}&hash=${hash}');

    if (response == 'error') {
      return;
    } else {
      List<Creator> list = [];
      response['data']['results'].forEach((e) => list.add(Creator.fromJson(e)));
      list.forEach((element) async => await element.verifyComics());
      return list;
    }
  }

  static Future<List<Creator>> searchCreator(String query) async {
    var timestamp = DateTime.now().millisecondsSinceEpoch.toString();
    String hash = Utils.generateHash(timestamp);
    var response = await RequestHelper.getRequest('${API_PATH}v1/public/creators?firstName=${query}&ts=${timestamp}&apikey=${PUBLIC_KEY}&hash=${hash}');

    if (response == 'error') {
      return [];
    } else {
      List<Creator> list = [];
      response['data']['results'].forEach((e) => list.add(Creator.fromJson(e)));
      return list;
    }
  }


}