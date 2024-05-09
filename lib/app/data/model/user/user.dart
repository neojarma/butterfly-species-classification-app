class User {
  final String email;
  final String username;
  final String fullName;
  final String imagePath;

  User({
    required this.email,
    required this.username,
    required this.fullName,
    required this.imagePath,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        email: json['email'],
        fullName: json['full_name'],
        imagePath: json['image_path'],
        username: json['username']);
  }
}
