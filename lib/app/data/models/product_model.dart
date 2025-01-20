import 'package:dhakashop/app/data/models/review_model.dart';

class ProductModel {
  int? category;
  List<ReviewsModel>? reviews;
  String? name;
  String? description;
  String? price;
  int? stock;
  String? createdAt;
  int? id;

  ProductModel(
      {this.category,
        this.reviews,
        this.name,
        this.description,
        this.price,
        this.stock,
        this.createdAt,
        this.id});

  ProductModel.fromJson(Map<String, dynamic> json) {
    category = json['category'];
    if (json['reviews'] != null) {
      reviews = <ReviewsModel>[];
      json['reviews'].forEach((v) {
        reviews!.add(new ReviewsModel.fromJson(v));
      });
    }
    name = json['name'];
    description = json['description'];
    price = json['price'];
    stock = json['stock'];
    createdAt = json['created_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['category'] = this.category;
    if (this.reviews != null) {
      data['reviews'] = this.reviews!.map((v) => v.toJson()).toList();
    }
    data['name'] = this.name;
    data['description'] = this.description;
    data['price'] = this.price;
    data['stock'] = this.stock;
    data['created_at'] = this.createdAt;
    data['id'] = this.id;
    return data;
  }
}



