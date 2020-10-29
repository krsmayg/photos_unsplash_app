class ImageModel {
  UserModel user;
  UrlModel urls;
  ImageModel({this.user, this.urls});

  factory ImageModel.fromMap(Map<String, dynamic> jsonData) {
    return ImageModel(
        urls: UrlModel.fromMap(jsonData['urls']),
        user: UserModel.fromMap(jsonData['user']));
  }
}

class UrlModel {
  final String full;
  final String regular;
  final String small;
  UrlModel({this.full, this.regular, this.small});
  factory UrlModel.fromMap(Map<String, dynamic> jsonData) {
    return UrlModel(
        full: jsonData['full'],
        regular: jsonData['regular'],
        small: jsonData['small']);
  }
}

class UserModel {
  final String name;
  final String bio;
  UserModel({this.name, this.bio});
  factory UserModel.fromMap(Map<String, dynamic> jsonData) {
    return UserModel(
      name: jsonData['name'],
      bio: jsonData['bio'],
    );
  }
}
