import 'dart:convert';
import 'dart:developer';
import 'package:dhakashop/app/data/constant/api_urls.dart';
import 'package:dhakashop/app/data/models/category_model.dart';
import 'package:dhakashop/app/data/models/product_model.dart';
import 'package:dhakashop/app/data/network_caller/network_caller.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class HomeController extends GetxController {

  NetworkCaller networkCaller=NetworkCaller();
  // List to store products
  var products = <ProductModel>[].obs;
  var categories = <CategoryModel>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchProduct();
    fetchCategory();
  }

  // Method to fetch products


  Future<void> fetchProduct() async {
    final response =await networkCaller.getNetwork(ApiUrls.productsUrl);
    if (response.statusCode == 200) {
      List<dynamic> productJson = json.decode(response.body);
      if (productJson.isNotEmpty) {
        products.value = productJson.map((item) => ProductModel.fromJson(item)).toList();
      } else {
        print('No products found');
      }
    } else {
      print('Failed to load products');
    }
  }


  Future<void> fetchCategory() async {
    final response =await networkCaller.getNetwork(ApiUrls.categoryUrl);
    if (response.statusCode == 200) {
      List<dynamic> categoryJson = json.decode(response.body);

      print(response.body);
      if (categoryJson.isNotEmpty) {
        categories.value = categoryJson.map((item) => CategoryModel.fromJson(item)).toList();
      } else {
        print('No Category found');
      }
    } else {
      print('Failed to load category');
    }
  }

//fetch product details







}
