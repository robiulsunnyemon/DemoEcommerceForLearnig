import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/category_product_controller.dart';

class CategoryProductView extends StatefulWidget {
   CategoryProductView({super.key});

  @override
  State<CategoryProductView> createState() => _CategoryProductViewState();
}

class _CategoryProductViewState extends State<CategoryProductView> {
  int id = Get.arguments["id"];

  final controller= Get.find<CategoryProductController>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.fetchCategoryProduct(id);
  }


  @override
  Widget build(BuildContext context) {
    print("categoryId::: $id");
    return Scaffold(
      appBar: AppBar(
        title: const Text('CategoryProductView'),
        centerTitle: true,
      ),
      body:Obx(()=>ListView.builder(
        itemCount: controller.categoryProducts.length,
        itemBuilder: (context, index) {
          return Card(
            child: Column(
              children: [
                Text(controller.categoryProducts[index].name ?? "no name")
              ],
            ),
          );
        },
      ))
    );
  }
}
