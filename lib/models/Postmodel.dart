// ignore_for_file: file_names

class Postmodel {
  String? status;
  Datamodel? data;

  Postmodel({this.status, this.data});

  Postmodel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? Datamodel.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Datamodel {
  Data? datamodel;

  Datamodel({this.datamodel});

  Datamodel.fromJson(Map<String, dynamic> json) {
    datamodel = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (datamodel != null) {
      data['data'] = datamodel!.toJson();
    }
    return data;
  }
}

class Data {
  String? name;
  String? duration;
  String? price;
  String? imageCover;
  String? createdAt;
  String? city;
  String? description;
  String? category;
  String? type;
  bool? available;
  String? user;
  String? sId;
  String? slug;
  int? iV;
  String? id;

  Data(
      {this.name,
      this.duration,
      this.price,
      this.imageCover,
      this.createdAt,
      this.city,
      this.description,
      this.category,
      this.type,
      this.available,
      this.user,
      this.sId,
      this.slug,
      this.iV,
      this.id});

  Data.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    duration = json['duration'];
    price = json['price'];
    imageCover = json['imageCover'];
    createdAt = json['createdAt'];
    city = json['city'];
    description = json['description'];
    category = json['category'];
    type = json['type'];
    available = json['available'];
    user = json['user'];
    sId = json['_id'];
    slug = json['slug'];
    iV = json['__v'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['duration'] = duration;
    data['price'] = price;
    data['imageCover'] = imageCover;
    data['createdAt'] = createdAt;
    data['city'] = city;
    data['description'] = description;
    data['category'] = category;
    data['type'] = type;
    data['available'] = available;
    data['user'] = user;
    data['_id'] = sId;
    data['slug'] = slug;
    data['__v'] = iV;
    data['id'] = id;
    return data;
  }
}
