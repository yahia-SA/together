class LoginModel {
  String? status;
  String? token;
  String? message;
  Data? data;

  LoginModel({this.status, this.token, this.message, this.data});

  LoginModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    token = json['token'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['token'] = token;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  User? user;

  Data({this.user});

  Data.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (user != null) {
      data['user'] = user!.toJson();
    }
    return data;
  }
}

class User {
  String? sId;
  String? name;
  String? email;
  String? phone;
  String? birthDate;
  String? city;
  String? address;
  String? yourPicture;
  String? iDPicture;
  String? role;
  int? iV;
  String? passwordChangedAt;

  User(
      {this.sId,
      this.name,
      this.email,
      this.phone,
      this.birthDate,
      this.city,
      this.address,
      this.yourPicture,
      this.iDPicture,
      this.role,
      this.iV,
      this.passwordChangedAt});

  User.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    birthDate = json['BirthDate'];
    city = json['city'];
    address = json['address'];
    yourPicture = json['YourPicture'];
    iDPicture = json['IDPicture'];
    role = json['role'];
    iV = json['__v'];
    passwordChangedAt = json['passwordChangedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['name'] = name;
    data['email'] = email;
    data['phone'] = phone;
    data['BirthDate'] = birthDate;
    data['city'] = city;
    data['address'] = address;
    data['YourPicture'] = yourPicture;
    data['IDPicture'] = iDPicture;
    data['role'] = role;
    data['__v'] = iV;
    data['passwordChangedAt'] = passwordChangedAt;
    return data;
  }
}
