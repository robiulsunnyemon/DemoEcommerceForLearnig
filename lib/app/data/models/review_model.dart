import 'package:dhakashop/app/data/models/user_model.dart';

class ReviewsModel {
  UserModel? user;
  int? product;
  int? rating;
  String? comment;
  String? createdAt;

  ReviewsModel({this.user, this.product, this.rating, this.comment, this.createdAt});

  ReviewsModel.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? new UserModel.fromJson(json['user']) : null;
    product = json['product'];
    rating = json['rating'];
    comment = json['comment'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    data['product'] = this.product;
    data['rating'] = this.rating;
    data['comment'] = this.comment;
    data['created_at'] = this.createdAt;
    return data;
  }
}