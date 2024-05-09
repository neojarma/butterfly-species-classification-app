class RegisterRequest {
  final String name;
  final String email;
  final String username;
  final String password;

  RegisterRequest({
    required this.name,
    required this.email,
    required this.username,
    required this.password,
  });

  Map<String, String> toJson() {
    return {
      'full_name': name,
      'email': email,
      'username': username,
      'password': password,
    };
  }
}
