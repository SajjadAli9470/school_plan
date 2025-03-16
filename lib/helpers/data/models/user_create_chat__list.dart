class UserNewChatList {
  String username;
  int userid;
  String email;

  UserNewChatList({
    required this.username,
    required this.userid,
    required this.email,
  });

  factory UserNewChatList.fromJson(Map<String, dynamic> json) =>
      UserNewChatList(
        username: json["name"],
        userid: json["id"],
        email: json["email"],
      );

  Map<String, dynamic> toJson() => {
        "username": username,
        "userid": userid,
        "email": email,
      };
}
