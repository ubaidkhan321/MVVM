import 'dart:convert';
import 'dart:io';

import 'package:handel_exception/Data/Network/BaseApi.dart';
import 'package:handel_exception/Data/app_exception.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class NetworkApi extends BaseApiServices {
  @override
  Future GetApiUrl(String url) async {
    dynamic  JsonRespone;
    try {
      final response =
          await http.get(Uri.parse(url)).timeout( const Duration(seconds: 10));
      JsonRespone = returnRespone(response);    
    } on Socket {
      throw FetchException("No Internet Connection");
    }
    return JsonRespone;
  }

  @override
  Future PostApiurl(String url , dynamic data) async {
   dynamic JsonRespone;
    try {
      Response response = await post(Uri.parse(url),
       body:  data
      ).timeout( const Duration(seconds: 10));
      JsonRespone = returnRespone(response);    
    } on Socket {
      throw FetchException("No Internet Connection");
    }
     return JsonRespone;
  }
     
  dynamic returnRespone(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic JsonRespone = jsonDecode(response.body);
        return JsonRespone;
      case 400:
        throw BedExceptionRequest(response.body.toString());
      case 404:
        throw UnauthorizedException(response.body.toString());      
      default:
        throw FetchException("Error occured while communication with" +
            "with status code" +
            response.statusCode.toString());
    }
  }
}
