import 'dart:convert';
import 'dart:ui';
import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:hq_personal_library/utils/api.dart';

class Utils {
  static void showSnackBar(String contentValue, GlobalKey<ScaffoldState> key){
    final snackBar = SnackBar(
        content: Text(contentValue,
            textAlign: TextAlign.center, style: TextStyle(fontSize: 15)));
    key.currentState.showSnackBar(snackBar);
  }

  static String generateHash(String timestamp){
    return md5.convert(utf8.encode(timestamp + PRIVATE_KEY + PUBLIC_KEY)).toString();
}

}