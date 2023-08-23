import 'package:flutter/material.dart';
import 'package:yes_no_app/domain/entities/Message.dart';

class ChatProvider extends ChangeNotifier {
  final scrollController = ScrollController();

  List<Message> messagesList = [
    Message(text: "Hola", fromWho: FromWho.me),
    Message(text: "Hi", fromWho: FromWho.her)

  ];

  Future<void> sendMessage( String messageToSend ) async {
    if (messageToSend.isNotEmpty) {
      final newMessage = Message(text: messageToSend, fromWho: FromWho.me);
      messagesList.add(newMessage);

      notifyListeners();
      moveScrollToBottom();

    }

  }

  void moveScrollToBottom() {
    scrollController.animateTo(
        scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.bounceIn
    );

  }

}