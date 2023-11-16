class Signin {
  Signin({
    required this.email,
    required this.password,
  });

  final String email;
  final String password;

  Map<String, Object?> toJson() {
    return {
      'email': email,
      'password': password,
    };
  }

  static Signin fromJson(Map<String, Object?> json) {
    return Signin(
      email: json['email'] as String,
      password: json['password'] as String,
    );
  }

  Signin copyWith({
    String? email,
    String? password,
  }) {
    return Signin(
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }
}

class SigninResponse {
  SigninResponse({
    required this.accessToken,
  });

  final String accessToken;

  Map<String, Object?> toJson() {
    return {
      'accessToken': accessToken,
    };
  }

  static SigninResponse fromJson(Map<String, Object?> json) {
    return SigninResponse(
      accessToken: json['accessToken'] as String,
    );
  }
}
