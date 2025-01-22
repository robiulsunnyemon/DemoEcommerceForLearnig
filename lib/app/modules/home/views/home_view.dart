import 'package:dhakashop/app/data/models/product_model.dart';
import 'package:dhakashop/app/data/models/review_model.dart';
import 'package:dhakashop/app/modules/login/controllers/login_controller.dart';
import 'package:dhakashop/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  HomeView({super.key});



  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeView'),
        centerTitle: true,
        actions: [
          IconButton(onPressed: (){

          },icon: Icon(Icons.logout_outlined),)
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Text("Products",style: TextStyle(fontSize: 30),),
          SizedBox(height: 15,),
          SizedBox(
            height: 100,
            child: Obx(
              () => ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: controller.products.length,
                itemBuilder: (context, index) {
                  print("length: ");
                  print(controller.products.length);
                  return Container(
                    width: 100,
                    decoration: BoxDecoration(
                     // color: Colors.deepPurple.shade100
                    ),
                    child: InkWell(
                      onTap: (){
                         Get.toNamed(Routes.PRODUCT_DETAILS,arguments: {"id": controller.products[index].id});
                      },
                      child: Card(
                        color: Colors.deepPurple.shade100,
                        child: Column(
                          children: [
                            Text(controller.products[index].name ?? ""),
                            Text(controller.products[index].price ?? ""),
                            _buildReviewWidget(controller.products[index].reviews),
                          ],
                        ),

                      ),
                    ),
                  );
                },
              ),
            ),
          ),

          SizedBox(height: 20,),
          Text("Categories",style: TextStyle(fontSize: 30),),
          SizedBox(height: 15,),
          SizedBox(
            height: 100,
            child: Obx(
                  () => ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: controller.categories.length,
                itemBuilder: (context, index) {
                  print("length: ");
                  print(controller.categories.length);
                  return Container(
                    width: 100,
                    decoration: BoxDecoration(
                      // color: Colors.deepPurple.shade100
                    ),
                    child: InkWell(
                      onTap: (){
                        Get.toNamed(Routes.CATEGORY_PRODUCT,
                            arguments: {"id":controller.categories[index].id}
                        );
                      },
                      child: Card(
                        color: Colors.deepPurple.shade100,
                        child: Column(
                          children: [
                            Text(controller.categories[index].name ??"Category"),
                          ],
                        ),

                      ),
                    ),
                  );
                },
              ),
            ),
          ),




        ],
      ),
    );
  }

  Widget _buildReviewWidget(List<ReviewsModel>? reviews){
    if(reviews!.isEmpty){
      return Text("0");
    }
    return Column(
      children: reviews.map((reviews){
        return Column(
          children: [
            Text(reviews.rating.toString())
          ],
        );
      }).toList()
    );
  }
}
