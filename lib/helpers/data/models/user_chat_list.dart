
class UserChatListModel {
  String chatId;
  String lastMessage;
  String timeStamp;
  String userId;
  Reciever reciever;
  UserChatListModel(
      {required this.chatId,
      required this.lastMessage,
      required this.timeStamp,
      required this.userId,
      required this.reciever});

  factory UserChatListModel.fromJson(Map<String, dynamic> json) {
    Reciever reciever = Reciever.fromJson(json['reciever']);

    return UserChatListModel(
      chatId: json["chatId"],
      lastMessage: json["LastMessage"],
      timeStamp: json["timeStamp"],
      userId: json["userId"],
      reciever: reciever,
    );
  }

  Map<String, dynamic> toJson() => {
        "chatId": chatId,
        "lastMessage": lastMessage,
        "timeStamp": timeStamp,
        "userId": userId,
        "reciever": reciever
      };
}

class Reciever {
  String id;
  int userId;
  String userName;

  Reciever({
    required this.id,
    required this.userId,
    required this.userName,
  });

  factory Reciever.fromJson(Map<String, dynamic> json) => Reciever(
        id: json["id"],
        userId: json["userId"],
        userName: json["userName"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "userId": userId,
        "userName": userName,
      };
}
