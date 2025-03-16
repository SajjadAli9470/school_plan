// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Message {
  String id;
  String sendarId;
  String recipientId;
  String chatId;
  String text;
  String timeStamp;
  int is_seen;

  Message({
    required this.is_seen,
    required this.id,
    required this.sendarId,
    required this.recipientId,
    required this.chatId,
    required this.text,
    required this.timeStamp,
  });

  factory Message.fromJson(Map<String, dynamic> json) => Message(
      is_seen: json['is_seen'],
      id: json["id"],
      sendarId: json["sendarId"],
      recipientId: json["recipientId"],
      chatId: json["chatId"],
      text: json["text"],
      timeStamp: json["timeStamp"]);

  Map<String, dynamic> toJson() => {
        "id": id,
        "sendarId": sendarId,
        "recipientId": recipientId,
        "chatId": chatId,
        "text": text,
        "timeStamp": timeStamp
      };
}

class UpdatedMessage {
  int to_id;
  int from_id;
  String message;
  DateTime updated_at;
  DateTime created_at;
  int id;
  String key;
  int? is_seen;

  UpdatedMessage({
    required this.is_seen,
    required this.to_id,
    required this.from_id,
    required this.message,
    required this.updated_at,
    required this.created_at,
    required this.id,
    required this.key,
  });

  UpdatedMessage copyWith({
    int? to_id,
    int? from_id,
    String? message,
    DateTime? updated_at,
    DateTime? created_at,
    int? id,
    String? key,
    int? is_seen,
  }) {
    return UpdatedMessage(
      is_seen: is_seen ?? this.is_seen,
      to_id: to_id ?? this.to_id,
      from_id: from_id ?? this.from_id,
      message: message ?? this.message,
      updated_at: updated_at ?? this.updated_at,
      created_at: created_at ?? this.created_at,
      id: id ?? this.id,
      key: key ?? this.key,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'to_id': to_id,
      'from_id': from_id,
      'message': message,
      'updated_at': updated_at.millisecondsSinceEpoch,
      'created_at': created_at.millisecondsSinceEpoch,
      'id': id,
      'key': key,
    };
  }

  factory UpdatedMessage.fromMap(Map<String, dynamic> map) {
    return UpdatedMessage(
      is_seen: map['is_seen'],
      to_id: map['to_id'] as int,
      from_id: map['from_id'] as int,
      message: map['message'] as String,
      updated_at: DateTime.parse(map['updated_at'].toString()),
      created_at: DateTime.parse(map['created_at'].toString()),
      id: map['id'] as int,
      key: map['key'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory UpdatedMessage.fromJson(String source) =>
      UpdatedMessage.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UpdatedMessage(to_id: $to_id, from_id: $from_id, message: $message, updated_at: $updated_at, created_at: $created_at, id: $id, key: $key)';
  }

  @override
  bool operator ==(covariant UpdatedMessage other) {
    if (identical(this, other)) return true;

    return other.to_id == to_id &&
        other.from_id == from_id &&
        other.message == message &&
        other.updated_at == updated_at &&
        other.created_at == created_at &&
        other.id == id &&
        other.key == key;
  }

  @override
  int get hashCode {
    return to_id.hashCode ^
        from_id.hashCode ^
        message.hashCode ^
        updated_at.hashCode ^
        created_at.hashCode ^
        id.hashCode ^
        key.hashCode;
  }
}
