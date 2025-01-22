import 'dart:convert';

import 'package:dhakashop/app/data/constant/api_urls.dart';
import 'package:dhakashop/app/data/network_caller/network_caller.dart';
import 'package:dhakashop/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {

  NetworkCaller networkCaller=NetworkCaller();
  
  Future<void> login( String username,String password)async {
    Map<String,dynamic> body={"username": username,"password": password};
    final response =await networkCaller.postData(ApiUrls.loginUrl,body);

    print("Response Code: ${response.statusCode}");
    print("Response Body: ${response.body}");

    if(response.statusCode==200){

      var jsonBody=jsonDecode(response.body);
      var token=jsonBody["token"];
      print("token::: $token");
      await saveToken(token);
      Get.toNamed(Routes.HOME);


    }else if(response.statusCode==404){
      print("Un Authorized");
    }
  }

  //check logged id user or not
  Future<void> saveToken(String token) async {

    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', token);
    print("Token saved successfully");

  }

  Future<String?> getToken() async {

    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('token');

  }

  Future<void> logout() async {

    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('token');
    print("Token removed successfully");
    Get.offAllNamed(Routes.LOGIN); // লগইন পেইজে পাঠানো

  }

  // Future<void> checkLoginStatus() async {
  //   String? token = await getToken();
  //   if (token != null) {
  //     print("User is already logged in with token: $token");
  //     Get.offAllNamed(Routes.HOME); // হোম পেইজে নেভিগেট করুন
  //   } else {
  //     print("User is not logged in");
  //     Get.offAllNamed(Routes.LOGIN); // লগইন পেইজে নেভিগেট করুন
  //   }
  // }

}
