import 'package:flutter/material.dart';

class StatusChatsList extends StatefulWidget {
  const StatusChatsList({super.key});

  @override
  State<StatusChatsList> createState() => _StatusChatsListState();
}

enum SelectedChatType { locked, unlocked, pending }

class _StatusChatsListState extends State<StatusChatsList> {
  SelectedChatType chatStatus = SelectedChatType.unlocked;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              chatStatus = SelectedChatType.unlocked;
            });
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Unlocked',
                style: TextStyle(
                    color: chatStatus == SelectedChatType.unlocked ? Color(0xffF5F5F5) : Colors.grey[600],
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
              Container(
                width: 60,
                height: 2,
                color: chatStatus == SelectedChatType.unlocked ? Colors.white : null,
              )
            ],
          ),
        ),
        SizedBox(
          width: 12,
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              chatStatus = SelectedChatType.pending;
            });
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Pending',
                style: TextStyle(
                    color: chatStatus == SelectedChatType.pending ? Color(0xffF5F5F5) : Colors.grey[600],
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
              Container(
                width: 60,
                height: 2,
                color: chatStatus == SelectedChatType.pending ? Colors.white : null,
              )
            ],
          ),
        ),
      ],
    );
  }
}
