class Signup {
  Signup({
    required this.email,
    required this.username,
    required this.password,
  });

  final String email;
  final String username;
  final String password;

  Map<String, Object?> toJson() {
    return {
      'email': email,
      'username': username,
      'password': password,
    };
  }

  static Signup fromJson(Map<String, Object?> json) {
    return Signup(
      email: json['email'] as String,
      username: json['username'] as String,
      password: json['password'] as String,
    );
  }

  Signup copyWith({
    String? email,
    String? username,
    String? password,
  }) {
    return Signup(
      email: email ?? this.email,
      username: username ?? this.username,
      password: password ?? this.password,
    );
  }
}
