import 'package:image_picker/image_picker.dart';

class RegisterRequestModel {
  final String name;
  final String email;
  final String password;
  final String phone;
  final XFile? profileImagePath;
  RegisterRequestModel({
    required this.name,
    required this.email,
    required this.password,
    required this.phone,
    this.profileImagePath,
  });
  Map<String, dynamic> toMap() {
    return {'name': name, 'email': email, 'password': password, 'phone': phone};
  }
}
