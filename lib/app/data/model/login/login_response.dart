import 'package:butterfly_classification/app/data/model/user/user.dart';

class LoginResponse {
  final String message;
  final String accessToken;
  final User user;
  final int statusCode;

  LoginResponse({
    required this.statusCode,
    required this.message,
    required this.accessToken,
    required this.user,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      statusCode: json['code'],
      message: json['message'] ?? '',
      accessToken: json['access_token'] ?? '',
      user: json['data'] != null
          ? User.fromJson(json['data'])
          : User(
              email: '',
              username: '',
              fullName: '',
              imagePath: '',
            ),
    );
  }
}
