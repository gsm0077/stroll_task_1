import 'package:flutter/material.dart';
import 'package:stroll/gen/assets.gen.dart';
import 'package:stroll/presentation/chats/widgets/chat_bubble.dart';
import 'package:stroll/presentation/chats/widgets/voice_card.dart';

class SingleChatScreens extends StatelessWidget {
  const SingleChatScreens({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        // backgroundColor: Colors.black,
        title: Text('Angelina, 28'),
        actions: [
          Icon(Icons.more_vert),
          SizedBox(width: 8),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          VoiceCard(
            title: "What is your favorite time of the day?",
            duration: "00:38",
            imageUrl: "https://i.pravatar.cc/40",
          ),
          SizedBox(height: 12),
          VoiceCard(
            title: "A friend from overseas is visiting, where would you bring them to?",
            duration: "00:38",
            imageUrl: "https://i.pravatar.cc/41",
          ),
          SizedBox(height: 24),
          Divider(color: Colors.white24),
          Center(
            child: Text("Chat Unlocked", style: TextStyle(color: Colors.white54)),
          ),
          Divider(color: Colors.white24),
          SizedBox(height: 16),

          // Chat Messages
          ChatBubble(
            text: "Hello 😉",
            isSender: true,
            avatarUrl: "https://i.pravatar.cc/42",
          ),
          ChatBubble(
            text: "Is there anybody in there? Just nod if you can hear me. Is there anyone home?",
            isSender: true,
            avatarUrl: "https://i.pravatar.cc/42",
          ),
          ChatBubble(text: "Come on now", isSender: false),
          ChatBubble(text: "I hear you're feeling down", isSender: false),
        ],
      ),
    );
  }
}

class SingleChatScreen extends StatefulWidget {
  const SingleChatScreen({super.key});

  @override
  _SingleChatScreenState createState() => _SingleChatScreenState();
}

class _SingleChatScreenState extends State<SingleChatScreen> {
  double topPadding = 300.0; // height of image
  bool isScrolled = false;

  void _onScroll(double offset) {
    if (!isScrolled && offset > 10) {
      setState(() {
        topPadding = 0;
        isScrolled = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Positioned.fill(
              child: Image.asset(
            Assets.pngs.joey.path,
            fit: BoxFit.cover,
          )),

          // Foreground list
          NotificationListener<ScrollNotification>(
            onNotification: (ScrollNotification notification) {
              _onScroll(notification.metrics.pixels);
              return false;
            },
            child: AnimatedContainer(
              duration: Duration(milliseconds: 300),
              curve: Curves.easeOut,
              padding: EdgeInsets.only(top: topPadding),
              child: ListView.builder(
                itemCount: 30,
                itemBuilder: (_, index) => ListTile(
                  tileColor: Colors.white.withOpacity(0.9),
                  title: Text("Item ${index + 1}"),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
