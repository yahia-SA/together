class Profilemodel {
  String? status;
  Datamodel? datamodel;

  Profilemodel({this.status, this.datamodel});

  Profilemodel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    datamodel = json['data'] != null
        ? Datamodel.fromJson(json['data'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (datamodel != null) {
      data['data'] = datamodel!.toJson();
    }
    return data;
  }
}

class Datamodel {
  Data? data;

  Datamodel({this.data});

  Datamodel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
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
  String? passwordResetExpires;
  String? passwordResetToken;

  Data(
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
      this.passwordChangedAt,
      this.passwordResetExpires,
      this.passwordResetToken});

  Data.fromJson(Map<String, dynamic> json) {
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
    passwordResetExpires = json['passwordResetExpires'];
    passwordResetToken = json['passwordResetToken'];
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
    data['passwordResetExpires'] = passwordResetExpires;
    data['passwordResetToken'] = passwordResetToken;
    return data;
  }
}
