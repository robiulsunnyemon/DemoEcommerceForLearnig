
import 'dart:convert';
import 'package:dhakashop/app/data/constant/api_urls.dart';
import 'package:dhakashop/app/data/models/product_model.dart';
import 'package:dhakashop/app/data/network_caller/network_caller.dart';
import 'package:get/get.dart';

class ProductDetailsController extends GetxController {

  NetworkCaller networkCaller =NetworkCaller();
  var product=Rxn<ProductModel>();

  Future<void> getProduct(int id) async{
    var url="${ApiUrls.productsUrl}/$id";
    final response=await networkCaller.getNetwork(url);
    if(response.statusCode==200){
      print(response.body);
      var body=jsonDecode(response.body);
      product.value=ProductModel.fromJson(body);
    }
  }
}
