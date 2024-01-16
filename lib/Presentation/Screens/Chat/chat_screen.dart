import 'package:app1/Presentation/Providers/chat_provider.dart';
import 'package:app1/Presentation/Widgets/Chat/her_message_bubble.dart';
import 'package:app1/Presentation/Widgets/Chat/my_message_bubble.dart';
import 'package:app1/Presentation/Widgets/Shared/mesagge_fieldbox.dart';
import 'package:app1/domain/Entities/message.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat Bot ☻'),
        leading: const Padding(
          padding: EdgeInsets.all(4.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
                'https://media.vogue.mx/photos/60e49f2d3a0166093ab3cabc/2:3/w_1920,c_limit/nicki-nicole.jpg'),
          ),
        ),
        centerTitle: true,
      ),
      body: _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final chatprovider = context.watch<Chatprovider>();

    return SafeArea(
      left: false,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
                child: ListView.builder(
              controller: chatprovider.chatScrollController,
              itemCount: chatprovider.mesaggeList.length,
              itemBuilder: (context, index) {
                final message = chatprovider.mesaggeList[index];
                return (message.fromWho == Fromwho.her)
                    ? HermessageBubble(
                        MessageHer: message,
                      )
                    : MymessageBubble(
                        messageMe: message,
                      );
              },
            )),
            //caja de texto
            MessageFieldBox(
              //onValue: (value) => chatprovider.sendMessage(value),
              onValue: (value) => chatprovider.sendMessage(value),
            )
          ],
        ),
      ),
    );
  }
}
