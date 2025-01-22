import 'package:get/get.dart';

import '../../../data/constant/api_urls.dart';
import '../../../data/network_caller/network_caller.dart';
import '../../../routes/app_pages.dart';

class SignupController extends GetxController {
  NetworkCaller networkCaller=NetworkCaller();

  Future<void> signup( String username,String password)async {

    Map<String,dynamic> body={"username": username,"email":"not@gmail.com","password": password};

    final response =await networkCaller.postData(ApiUrls.signupUrl,body);
    print("Response Code: ${response.statusCode}");
    print("Response Body: ${response.body}");
    if(response.statusCode==201){
      Get.toNamed(Routes.LOGIN);
    }else if(response.statusCode==404){
      print("Un Authorized");
    }
  }
}
