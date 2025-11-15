class UserProfileModel {
  final String name;
  final String email;
  final String image;

  UserProfileModel({
    required this.name,
    required this.email,
    required this.image,
  });
  factory UserProfileModel.fromJson(Map<String, dynamic> json) {
    return UserProfileModel(
      name: json['name'],
      email: json['email'],
      image: json['image'].replaceFirst("http://", "https://"),
    );
  }
}
