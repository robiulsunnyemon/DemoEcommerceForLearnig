import 'dart:convert';

import 'package:http/http.dart' as http;

class NetworkCaller{

  Future<http.Response> getNetwork(String url) async{
    final response = await http.get(Uri.parse(url));
    return response;
  }

  Future<http.Response> postData(String url,Map<String,dynamic> body) async{
    final response =await http.post(Uri.parse(url),body: jsonEncode(body),headers: {"Content-Type": "application/json"},);
    return response;
  }


}