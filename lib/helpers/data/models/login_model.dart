// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Login {
  final String token;
  final String name;
  final String? last_name;
  final String? email;
  final String? password;
  Login({
    required this.token,
    required this.name,
    this.last_name,
    this.email,
    this.password,
  });

  Login copyWith({
    String? token,
    String? name,
    String? last_name,
    String? email,
    String? password,
  }) {
    return Login(
      token: token ?? this.token,
      name: name ?? this.name,
      last_name: last_name ?? this.last_name,
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'token': token,
      'name': name,
      'last_name': last_name,
      'email': email,
      'password': password,
    };
  }

  factory Login.fromMap(Map<String, dynamic> map) {
    return Login(
      token: map['token'] ?? '',
      name: map['name'] ?? '',
      last_name: map['last_name'] != null ? map['last_name'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
      password: map['password'] != null ? map['password'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Login.fromJson(String source) =>
      Login.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Login(token: $token, name: $name, last_name: $last_name, email: $email, password: $password)';
  }

  @override
  bool operator ==(covariant Login other) {
    if (identical(this, other)) return true;

    return other.token == token &&
        other.name == name &&
        other.last_name == last_name &&
        other.email == email &&
        other.password == password;
  }

  @override
  int get hashCode {
    return token.hashCode ^
        name.hashCode ^
        last_name.hashCode ^
        email.hashCode ^
        password.hashCode;
  }
}
