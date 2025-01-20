import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../data/models/review_model.dart';
import '../controllers/product_details_controller.dart';

class ProductDetailsView extends StatelessWidget {
   ProductDetailsView({super.key});

  int id = Get.arguments["id"];
  final controller = Get.find<ProductDetailsController>();


  @override
  Widget build(BuildContext context) {
    controller.getProduct(id);
    return Scaffold(
      appBar: AppBar(
        title: const Text('ProductDetailsView'),
        centerTitle: true,
      ),
      body: Obx(() {

        var product = controller.product.value;
        var reviews = product?.reviews ?? []; //rating list


        return Column(

          children: [
            Text(product?.name ?? ""),
            Text(product?.description ?? ""),
            Text(product?.price ?? ""),
            Text(product?.stock.toString() ?? ""),
            Text(product?.createdAt.toString() ?? ""),

            //display rating
            Container(
              height: 100,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: reviews.length,
                itemBuilder: (context, index) {
                  var username = reviews[index].user?.username ?? "No username"; //display user information
                  return Row(
                    children: [
                      Text(reviews[index].rating.toString() ?? "no rating"),
                      Text(reviews[index].comment ?? "no comment"),
                      SizedBox(width: 20,),
                      Text(username),
                    ],
                  );
                },
              ),
            ),










          ],
        );
      }),
    );
  }
}

