import 'package:flutter/cupertino.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:native_app/util/mybasecontroller.dart';

class ChatController extends MyBaseController {
  final messageController = TextEditingController();
  RxList<ChatMessage> messageList = [
    ChatMessage(isUser: false, message: 'hello how are you', messageType: MessageType.message),
    ChatMessage(isUser: true, message: 'hello how are you', messageType: MessageType.message),
    ChatMessage(isUser: false, message: 'hello how are you', messageType: MessageType.message),

    ChatMessage(isUser: false, message: 'hello how are you', messageType: MessageType.message),

    ChatMessage(isUser: false, message: 'hello how are you', messageType: MessageType.message),
    ChatMessage(isUser: true, message: 'hello how are you', messageType: MessageType.message),
    ChatMessage(isUser: false, message: 'hello how are you', messageType: MessageType.message),
    ChatMessage(
        isUser: true,
        message: '',
        messageType: MessageType.image,
        url: "https://images.pexels.com/photos/7583935/pexels-photo-7583935.jpeg?auto=compress&cs=tinysrgb&w=1600"),
    ChatMessage(
        isUser: false,
        message: '',
        messageType: MessageType.image,
        url: "https://images.pexels.com/photos/7583935/pexels-photo-7583935.jpeg?auto=compress&cs=tinysrgb&w=1600"),
  ].obs;

  void onSubmit() {
    messageList.insert(
      0,
      ChatMessage(
        isUser: true,
        message: messageController.text,
        messageType: MessageType.message,
      ),
    );
    messageController.clear();
  }
}

class ChatMessage {
  String message;
  String? url;
  bool isUser;
  MessageType messageType;

  ChatMessage({
    required this.isUser,
    required this.message,
    required this.messageType,
    this.url,
  });
}

enum MessageType {
  image,
  message,
}
