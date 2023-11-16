class User {
  User({
    this.id,
    this.username,
    required this.email,
    required this.password,
  });

  final String? id;
  final String? username;
  final String email;
  final String password;

  Map<String, Object?> toJson() {
    return {
      'username': username,
      'email': email,
      'password': password,
    };
  }

  static User fromJson(Map<String, Object?> json) {
    return User(
      id: json['id'] as String?,
      username: json['username'] as String?,
      email: json['email'] as String? ?? '',
      password: json['password'] as String? ?? '',
    );
  }

  User copyWith({
    String? id,
    String? username,
    String? email,
    String? password,
  }) {
    return User(
      id: id ?? this.id,
      username: username ?? this.username,
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }
}
