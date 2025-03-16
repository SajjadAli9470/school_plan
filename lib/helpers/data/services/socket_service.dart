import 'dart:developer';

import 'package:get/get.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class SocketService {
  static late IO.Socket socket;

  void initSocketConnection(String? userSlug) {
    if (userSlug != null) {
      try {
        socket = IO.io("Socket URL", <String, dynamic>{
          'autoConnect': true,
          'transports': ['websocket'],
        });
        socket.onDisconnect((e) => log('disconnect : ${e}'));

        socket.onConnectError((err) => log("onConnectError :  ${err}"));
        socket.onError((err) => log("onError : ${err}"));
      } catch (e) {
        log("error While Connecting Sockets.... $e");
      }
  
      connectToServer(userSlug);
    } else {
      Get.snackbar('Acountant not found', "Accountant is not assigned yet");
    }
  }

  void connectToServer(String userSlug) {
    // var userid = GetStorage().read(Strings.userId);
    // var chatUserID = GetStorage().read(Strings.chatUserID);

    log(" try to connect \n\n\n $userSlug");

    socket.onConnect((_) {

    });
  }
}
