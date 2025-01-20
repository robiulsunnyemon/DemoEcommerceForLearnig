class UserModel {
  int? id;
  String? username;
  String? email;
  bool? isStaff;
  bool? isSuperuser;
  String? dateJoined;

  UserModel(
      {this.id,
        this.username,
        this.email,
        this.isStaff,
        this.isSuperuser,
        this.dateJoined});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    email = json['email'];
    isStaff = json['is_staff'];
    isSuperuser = json['is_superuser'];
    dateJoined = json['date_joined'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['username'] = this.username;
    data['email'] = this.email;
    data['is_staff'] = this.isStaff;
    data['is_superuser'] = this.isSuperuser;
    data['date_joined'] = this.dateJoined;
    return data;
  }
}