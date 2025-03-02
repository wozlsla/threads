class UserModel {
  final String profileImage;
  final String uid;
  final String userName;
  final String followers;
  final bool follow;

  UserModel({
    required this.profileImage,
    required this.uid,
    required this.userName,
    required this.followers,
    required this.follow,
  });

  // type 'Null' is not a subtype of type 'String'
  UserModel.fromJson(Map<String, dynamic> json)
      : profileImage = json["profileImage"] ?? "",
        uid = json["uid"] ?? "",
        userName = json["userName"] ?? "",
        followers = json["followers"] ?? "",
        follow = json["follow"] ?? false;

  Map<String, dynamic> toJson() {
    return {
      "profileImage": profileImage,
      "uid": uid,
      "userName": userName,
      "followers": followers,
      "follow": follow,
    };
  }
}
