import 'package:http/http.dart' as http;

class NetworkCaller{

  Future<http.Response> getNetwork(String url) async{
    final response = await http.get(Uri.parse(url));
    return response;
  }

}