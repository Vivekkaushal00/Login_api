class HomeData {
  bool? success;
  int? code;
  String? message;
  Data? data;

  HomeData({this.success, this.code, this.message, this.data});

  HomeData.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    code = json['code'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['code'] = this.code;
    data['message'] = this.message;
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
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}

class User {
  Bio? bio;
  String? sId;
  String? fullName;
  String? email;
  String? password;
  String? profile;
  String? location;
  String? role;
  String? createdAt;
  String? updatedAt;
  int? iV;

  User(
      {this.bio,
        this.sId,
        this.fullName,
        this.email,
        this.password,
        this.profile,
        this.location,
        this.role,
        this.createdAt,
        this.updatedAt,
        this.iV});

  User.fromJson(Map<String, dynamic> json) {
    bio = json['bio'] != null ? new Bio.fromJson(json['bio']) : null;
    sId = json['_id'];
    fullName = json['fullName'];
    email = json['email'];
    password = json['password'];
    profile = json['profile'];
    location = json['location'];
    role = json['role'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.bio != null) {
      data['bio'] = this.bio!.toJson();
    }
    data['_id'] = this.sId;
    data['fullName'] = this.fullName;
    data['email'] = this.email;
    data['password'] = this.password;
    data['profile'] = this.profile;
    data['location'] = this.location;
    data['role'] = this.role;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}

class Bio {
  String? aboutMe;
  String? woIWouldLikeToConnect;
  String? facebook;
  String? instagram;
  String? tweeter;
  String? tiktok;
  String? linkdine;
  String? website;
  List<String>? tags;

  Bio(
      {this.aboutMe,
        this.woIWouldLikeToConnect,
        this.facebook,
        this.instagram,
        this.tweeter,
        this.tiktok,
        this.linkdine,
        this.website,
        this.tags});

  Bio.fromJson(Map<String, dynamic> json) {
    aboutMe = json['aboutMe'];
    woIWouldLikeToConnect = json['woIWouldLikeToConnect'];
    facebook = json['facebook'];
    instagram = json['instagram'];
    tweeter = json['tweeter'];
    tiktok = json['tiktok'];
    linkdine = json['linkdine'];
    website = json['website'];
    tags = json['tags'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['aboutMe'] = this.aboutMe;
    data['woIWouldLikeToConnect'] = this.woIWouldLikeToConnect;
    data['facebook'] = this.facebook;
    data['instagram'] = this.instagram;
    data['tweeter'] = this.tweeter;
    data['tiktok'] = this.tiktok;
    data['linkdine'] = this.linkdine;
    data['website'] = this.website;
    data['tags'] = this.tags;
    return data;
  }
}
