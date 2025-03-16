class OnlineUser {
  String id;

  OnlineUser({
    required this.id,
  });

  factory OnlineUser.fromJson(Map<String, dynamic> json) =>
      OnlineUser(id: json['id']);

  Map<String, dynamic> toJson() => {
        "id": id,
      };
}
