class RegisterResponseModel {
  final String message;
  final String statusCode;

  RegisterResponseModel({required this.message, required this.statusCode});
  factory RegisterResponseModel.fromJson(Map<String, dynamic> json) {
    return RegisterResponseModel(
      message: json['message'],
      statusCode: json['code'],
    );
  }
}
