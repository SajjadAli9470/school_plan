import 'dart:convert';

class UserModel {
  int? id;
  String? name;
  String? email;
  dynamic email_verified_at;
  String? authtoken;
  String? last_LoginData;
  String? created_at;
  String? updated_at;
  dynamic deleted_at;
  int? is_active;
  dynamic phone;
  String? web_device_token;
  String? app_device_token;
  List<String>? device_tokens;
  String? last_chat_notify_at;
  UserModel({
    this.id,
    this.name,
    this.email,
    required this.email_verified_at,
    this.authtoken,
    this.last_LoginData,
    this.created_at,
    this.updated_at,
    required this.deleted_at,
    this.is_active,
    required this.phone,
    this.web_device_token,
    this.app_device_token,
    this.device_tokens,
    
    this.last_chat_notify_at,
  });

  UserModel copyWith({
    int? id,
    String? name,
    String? email,
    dynamic? email_verified_at,
    String? authtoken,
    String? last_LoginData,
    String? created_at,
    String? updated_at,
    dynamic? deleted_at,
    int? is_active,
    dynamic? phone,
    String? web_device_token,
    String? app_device_token,
    List<String>? device_tokens,

    String? last_chat_notify_at,
  }) {
    return UserModel(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      email_verified_at: email_verified_at ?? this.email_verified_at,
      authtoken: authtoken ?? this.authtoken,
      last_LoginData: last_LoginData ?? this.last_LoginData,
      created_at: created_at ?? this.created_at,
      updated_at: updated_at ?? this.updated_at,
      deleted_at: deleted_at ?? this.deleted_at,
      is_active: is_active ?? this.is_active,
      phone: phone ?? this.phone,
      web_device_token: web_device_token ?? this.web_device_token,
      app_device_token: app_device_token ?? this.app_device_token,
      device_tokens: device_tokens ?? this.device_tokens,

      last_chat_notify_at: last_chat_notify_at ?? this.last_chat_notify_at,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'email': email,
      'email_verified_at': email_verified_at,
      'authtoken': authtoken,
      'last_LoginData': last_LoginData,
      'created_at': created_at,
      'updated_at': updated_at,
      'deleted_at': deleted_at,
      'is_active': is_active,
      'phone': phone,
      'web_device_token': web_device_token,
      'app_device_token': app_device_token,
      'device_tokens': device_tokens,
      'last_chat_notify_at': last_chat_notify_at,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] != null ? map['id'] as int : null,
      name: map['name'] != null ? map['name'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
      email_verified_at: map['email_verified_at'] as dynamic,
      authtoken: map['authtoken'] != null ? map['authtoken'] as String : null,
      last_LoginData:
          map['last_LoginData'] != null ? map['last_LoginData'] as String : null,
      created_at:
          map['created_at'] != null ? map['created_at'] as String : null,
      updated_at:
          map['updated_at'] != null ? map['updated_at'] as String : null,
      deleted_at: map['deleted_at'] as dynamic,
      is_active: map['is_active'] != null ? map['is_active'] as int : null,
      phone: map['phone'] as dynamic,
      web_device_token: map['web_device_token'] != null
          ? map['web_device_token'] as String
          : null,
      app_device_token: map['app_device_token'] != null
          ? map['app_device_token'] as String
          : null,
      device_tokens: map['device_tokens'] != null
          ? List.from((map['device_tokens'] as List))
          : null,
      
      last_chat_notify_at: map['last_chat_notify_at'] != null
          ? map['last_chat_notify_at'] as String
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'User(id: $id, name: $name, email: $email, email_verified_at: $email_verified_at, authtoken: $authtoken, last_LoginData: $last_LoginData, created_at: $created_at, updated_at: $updated_at, deleted_at: $deleted_at, is_active: $is_active, phone: $phone, web_device_token: $web_device_token, app_device_token: $app_device_token, device_tokens: $device_tokens, last_chat_notify_at: $last_chat_notify_at)';
  }

  @override
  bool operator ==(covariant UserModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.email == email &&
        other.email_verified_at == email_verified_at &&
        other.authtoken == authtoken &&
        other.last_LoginData == last_LoginData &&
        other.created_at == created_at &&
        other.updated_at == updated_at &&
        other.deleted_at == deleted_at &&
        other.is_active == is_active &&
        other.phone == phone &&
        other.web_device_token == web_device_token &&
        other.app_device_token == app_device_token &&
        other.last_chat_notify_at == last_chat_notify_at;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        email.hashCode ^
        email_verified_at.hashCode ^
        authtoken.hashCode ^
        last_LoginData.hashCode ^
        created_at.hashCode ^
        updated_at.hashCode ^
        deleted_at.hashCode ^
        is_active.hashCode ^
        phone.hashCode ^
        web_device_token.hashCode ^
        app_device_token.hashCode ^
        device_tokens.hashCode ^
   
        last_chat_notify_at.hashCode;
  }
}
