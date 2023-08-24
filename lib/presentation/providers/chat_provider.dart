import 'package:flutter/material.dart';
import 'package:yes_no_app/domain/entities/Message.dart';
import 'package:yes_no_app/domain/helpers/get_yes_or_not_answer.dart';

class ChatProvider extends ChangeNotifier {
  final scrollController = ScrollController();

  final messageError = Message(text: "No sé", fromWho: FromWho.her);

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

      if (messageToSend.endsWith("?")) {
        herReply();

      }

    }

  }

  Future<void> herReply() async {
    final messageReply = await GetYesOrNotAnswer.getAnswer();
    messageReply != null ? messagesList.add(messageReply) : messageError;

    notifyListeners();

  }

  void moveScrollToBottom() {
    scrollController.animateTo(
        scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.bounceIn
    );

  }

}