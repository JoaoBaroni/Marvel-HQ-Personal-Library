import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:hq_personal_library/utils/api.dart';

class Utils {

  static String generateHash(String timestamp){
    return md5.convert(utf8.encode(timestamp + PRIVATE_KEY_1 + PUBLIC_KEY_1)).toString();
}

}