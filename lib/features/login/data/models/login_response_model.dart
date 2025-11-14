class LoginResponseModel {
  final int code;
  final String message;
  final String name;
  final String email;
  final String image;
  final String token;

  LoginResponseModel({
    required this.code,
    required this.message,
    required this.name,
    required this.email,
    required this.image,
    required this.token,
  });

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    return LoginResponseModel(
      code: json['code'],
      message: json['message'],
      name: json['data']['name'],
      email: json['data']['email'],
      image: json['data']['image'],
      token: json['data']['token'],
    );
  }
}
