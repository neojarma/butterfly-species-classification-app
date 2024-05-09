class RegisterResponse {
  final int statusCode;
  final String message;

  RegisterResponse({
    required this.statusCode,
    required this.message,
  });

  factory RegisterResponse.fromJson(Map<String, dynamic> json) {
    return RegisterResponse(
      statusCode: json['code'],
      message: json['message'],
    );
  }
}
