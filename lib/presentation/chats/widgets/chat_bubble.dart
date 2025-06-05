import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {
  final String text;
  final bool isSender;
  final String? avatarUrl;

  const ChatBubble({
    super.key,
    required this.text,
    this.isSender = false,
    this.avatarUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: isSender ? MainAxisAlignment.start : MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        if (isSender && avatarUrl != null) CircleAvatar(backgroundImage: NetworkImage(avatarUrl!), radius: 14),
        if (isSender) SizedBox(width: 8),
        Container(
          margin: EdgeInsets.symmetric(vertical: 4),
          padding: EdgeInsets.all(12),
          constraints: BoxConstraints(maxWidth: 260),
          decoration: BoxDecoration(
            color: isSender ? Colors.white12 : Colors.white24,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Text(text, style: TextStyle(color: Colors.white)),
        ),
      ],
    );
  }
}
