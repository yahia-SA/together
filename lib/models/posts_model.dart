class PostsModel {
  String? status;
  int? results;
  Datamodel? datamodel;

  PostsModel({this.status, this.results, this.datamodel});

  PostsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    results = json['results'];
    datamodel = json['data'] != null
        ? Datamodel.fromJson(json['data'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['results'] = results;
    if (datamodel != null) {
      data['data'] = datamodel!.toJson();
    }
    return data;
  }
}

class Datamodel {
  List<Data>? data;

  Datamodel({this.data});

  Datamodel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? sId;
  String? name;
  String? duration;
  String? price;
  String? imageCover;
  String? city;
  String? description;
  String? category;
  String? type;
  bool? available;
  User? user;
  String? slug;
  String? id;

  Data(
      {this.sId,
      this.name,
      this.duration,
      this.price,
      this.imageCover,
      this.city,
      this.description,
      this.category,
      this.type,
      this.available,
      this.user,
      this.slug,
      this.id});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    duration = json['duration'];
    price = json['price'];
    imageCover = json['imageCover'];
    city = json['city'];
    description = json['description'];
    category = json['category'];
    type = json['type'];
    available = json['available'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    slug = json['slug'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['name'] = name;
    data['duration'] = duration;
    data['price'] = price;
    data['imageCover'] = imageCover;
    data['city'] = city;
    data['description'] = description;
    data['category'] = category;
    data['type'] = type;
    data['available'] = available;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    data['slug'] = slug;
    data['id'] = id;
    return data;
  }
}

class User {
  String? sId;
  String? name;
  String? phone;
  String? city;
  String? address;
  String? yourPicture;

  User(
      {this.sId,
      this.name,
      this.phone,
      this.city,
      this.address,
      this.yourPicture});

  User.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    phone = json['phone'];
    city = json['city'];
    address = json['address'];
    yourPicture = json['YourPicture'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['name'] = name;
    data['phone'] = phone;
    data['city'] = city;
    data['address'] = address;
    data['YourPicture'] = yourPicture;
    return data;
  }
}
