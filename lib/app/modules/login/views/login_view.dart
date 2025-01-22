import 'package:dhakashop/app/data/network_caller/network_caller.dart';
import 'package:dhakashop/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
   LoginView({super.key});

  NetworkCaller networkCaller=NetworkCaller();
  final TextEditingController _userNameTEController=TextEditingController();
  final TextEditingController _passwordTEController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LoginView'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextFormField(
              controller: _userNameTEController,
              decoration: InputDecoration(
                hintText: "Username"
              ),
            ),
            SizedBox(height: 20,),
            TextFormField(
              controller: _passwordTEController,
              decoration: InputDecoration(
                  hintText: "Password"
              ),
            ),
            SizedBox(height: 25,),
            ElevatedButton(
                onPressed: (){
                  controller.login(_userNameTEController.text, _passwordTEController.text);
                },
                child: Text("Login",style: TextStyle(fontSize: 20),)
            ),

            SizedBox(height: 25,),
            ElevatedButton(
                onPressed: (){
                 Get.toNamed(Routes.SIGNUP);
                },
                child: Text("Signup",style: TextStyle(fontSize: 20),)
            )

          ],
        ),
      ),
    );
  }
}

