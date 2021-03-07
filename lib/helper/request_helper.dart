import 'package:http/http.dart' as http;
import 'dart:convert';

class RequestHelper {

  static Future<dynamic> getRequest(String url) async{
    http.Response response = await http.get(url);

    try{
      if(response.statusCode == 200){
        String data = response.body;
        var decodedData = jsonDecode(data);
        return decodedData;
      }else{
        return 'error';
      }
    }catch(e){
      return 'error';
    }


  }

}