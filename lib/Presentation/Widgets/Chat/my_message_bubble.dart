import 'package:app1/domain/Entities/message.dart';
import 'package:flutter/material.dart';

class MymessageBubble extends StatelessWidget {
  final Message messageMe;

  const MymessageBubble({super.key, required this.messageMe});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          decoration: BoxDecoration(
              color: colors.primary, borderRadius: BorderRadius.circular(20)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              messageMe.text,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontStyle: FontStyle.normal),
            ),
          ),
        ),
        SizedBox(
          height: 5,
        )
      ],
    );
  }
}
