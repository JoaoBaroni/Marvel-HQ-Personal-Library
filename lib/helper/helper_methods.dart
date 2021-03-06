import 'package:flutter/material.dart';
import 'package:hq_personal_library/helper/request_helper.dart';
import 'package:hq_personal_library/utils/api.dart';
import 'package:hq_personal_library/utils/utils.dart';


class HelperMethods {

  static Future<dynamic> getHQ(String value) async{
    var timestamp = DateTime.now().toString();
    String hash = Utils.generateHash(timestamp);
    var response = await RequestHelper.getRequest('${API_PATH}v1/public/comics/ts=${timestamp}&apikey=${PUBLIC_KEY}&hash=${hash}');
  }



}