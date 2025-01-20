import 'dart:convert';

import 'package:get/get.dart';

import '../../../data/constant/api_urls.dart';
import '../../../data/models/product_model.dart';
import '../../../data/network_caller/network_caller.dart';

class CategoryProductController extends GetxController {

  NetworkCaller networkCaller=NetworkCaller();
  // List to store products
  var categoryProducts = <ProductModel>[].obs;
  var isLoading = true.obs;



  // Method to fetch products

  Future<void> fetchCategoryProduct(int id) async {
    final url="${ApiUrls.categoryProductUrl}$id";
    final response =await networkCaller.getNetwork(url);
    if (response.statusCode == 200) {
      print(response.body);
      List<dynamic> productJson = json.decode(response.body);
      if (productJson.isNotEmpty) {
        categoryProducts.value = productJson.map((item) => ProductModel.fromJson(item)).toList();
      } else {
        print('No products found');
      }
    } else {
      print('Failed to load products');
    }
  }
}
