import 'package:app1/Config/helpers/get_yes_no_answer.dart';
import 'package:app1/domain/Entities/message.dart';
import 'package:flutter/material.dart';

class Chatprovider extends ChangeNotifier {
  final ScrollController chatScrollController = ScrollController();
  final getYesNoAnswer GetYesNoAnswer = getYesNoAnswer();
  List<Message> mesaggeList = [
    Message(text: 'Hola amor', fromWho: Fromwho.me),
    Message(text: 'ya regresaste del trabajo?', fromWho: Fromwho.me)
  ];

  Future<void> sendMessage(String text) async {
    if (text.isEmpty) return;
    final newMessage = Message(text: text, fromWho: Fromwho.me);
    mesaggeList.add(newMessage);
    if (text.endsWith('?')) {
      herReply();
    }
    notifyListeners();
    moveScrollToBottom();
  }

  Future<void> herReply() async {
    final herMessage = await GetYesNoAnswer.getAnswer();
    mesaggeList.add(herMessage);
    notifyListeners();
    moveScrollToBottom();
  }

  Future<void> moveScrollToBottom() async {
    await Future.delayed(const Duration(milliseconds: 100));
    chatScrollController.animateTo(
        chatScrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut);
  }
}
