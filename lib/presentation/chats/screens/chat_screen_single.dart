import 'package:flutter/material.dart';
import 'package:stroll/core/constants/app_colors.dart';
import 'package:stroll/gen/assets.gen.dart';
import 'package:stroll/presentation/chats/widgets/chat_bubble.dart';
import 'package:stroll/presentation/chats/widgets/voice_card.dart';

class ChatScreenSingle extends StatefulWidget {
  const ChatScreenSingle({super.key});

  @override
  State<ChatScreenSingle> createState() => _ChatScreenSingleState();
}

class _ChatScreenSingleState extends State<ChatScreenSingle> {
  bool overlayDissapear = false;
  double initialOpacity = 0;
  double initialScale = 0.85;
  double imageScaled = 1; //1 to 1.08
  double intialBgOpacity = 0.5;
  starterAnimate() async {
    Future.delayed(Duration(milliseconds: 500), () {
      setState(() {
        imageScaled = 1.08;
        intialBgOpacity = 1;
      });
      Future.delayed(Duration(milliseconds: 500), () {
        setState(() {
          initialOpacity = 1;
          initialScale = 1;
        });
      });
    });
  }

  @override
  void initState() {
    super.initState();

    starterAnimate();
    draggableController = DraggableScrollableController();

    draggableController.addListener(() {
      final reachedTop = draggableController.size >= 0.8; // maxChildSize
      if (reachedTop != isAtTop) {
        setState(() {
          isAtTop = reachedTop;
          intialBgOpacity = 0;
          topIconSize = 1;
        });
        print('Reached top: $reachedTop');
        // You can call a function or trigger UI changes here
      }
    });
  }

  double topIconSize = 0;
  late DraggableScrollableController draggableController;
  bool isAtTop = false;

  List<Widget> chatList = [];
  TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final topPadding = MediaQuery.of(context).padding.top;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Positioned.fill(
            child: AnimatedOpacity(
              opacity: intialBgOpacity,
              duration: Duration(seconds: 1, microseconds: 500),
              child: Image.asset(
                Assets.jpg.bgChat.path,
                fit: BoxFit.cover,
              ),
            ),
          ),
          AnimatedOpacity(
            opacity: initialOpacity,
            duration: Duration(milliseconds: 700),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: topPadding, left: 16, right: 16),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 6,
                          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(8)),
                        ),
                      ),
                      SizedBox(
                        width: 6,
                      ),
                      Expanded(
                        child: Container(
                          height: 6,
                          decoration: BoxDecoration(color: Colors.grey, borderRadius: BorderRadius.circular(8)),
                          padding: EdgeInsets.all(16),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  // height: 60, // 👈 set your custom height here
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      IconButton(
                        icon: Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                        ), // iOS-style back arrow
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      Column(
                        children: [
                          AnimatedContainer(
                            duration: Duration(milliseconds: 600),
                            width: 50 * topIconSize,
                            height: 50 * topIconSize,
                            margin: EdgeInsets.only(top: 15),
                            decoration: BoxDecoration(
                              // border: Border.all(
                              //   width: 8,
                              //   color: Color(0xff0D0F11),
                              // ),
                              borderRadius: BorderRadius.circular(100),
                              image: DecorationImage(
                                image: AssetImage(Assets.pngs.joey.path),
                                // fit: BoxFit.fill, // Or use BoxFit.contain/cover/fill
                              ),
                            ),
                          ),
                          Text('John Doe, 28',
                              style: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold)),
                        ],
                      ),
                      IconButton(
                        color: Colors.white,
                        icon: Icon(
                          Icons.more_horiz,
                        ), // Three horizontal dots
                        onPressed: () {
                          // Handle menu action
                        },
                      ),
                    ],
                  ),
                ),
                Spacer(),
              ],
            ),
          ),
          Positioned.fill(
            child: DraggableScrollableSheet(
              initialChildSize: isAtTop ? 0.83 : 0.4,
              minChildSize: isAtTop ? 0.83 : 0.4,
              maxChildSize: 0.83,
              controller: draggableController,
              snapAnimationDuration: Duration(milliseconds: 600),
              builder: (context, scrollController) {
                return Container(
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.vertical(top: Radius.circular(0)),
                    boxShadow: [BoxShadow(blurRadius: 10, color: Colors.black26)],
                  ),
                  child: ListView(
                    padding: EdgeInsets.only(
                      left: 16,
                      right: 16,
                    ),
                    controller: scrollController,
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
                      Column(
                        children: chatList,
                      ),
                      SizedBox(
                        height: 60,
                      )
                    ],
                  ),
                );
              },
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              color: Colors.black,
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      style: TextStyle(color: Colors.white),
                      controller: textController,
                      decoration: InputDecoration(
                        hintText: 'Type your message...',
                        hintStyle: TextStyle(color: Colors.grey),
                        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                      onPressed: () {
                        chatList.add(
                          ChatBubble(text: textController.text, isSender: false),
                        );
                        textController.text = '';

                        setState(() {});
                      },
                      icon: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Icon(
                          Icons.send,
                          size: 35,
                        ),
                      ))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class CustomAppBarPage extends StatelessWidget {
  const CustomAppBarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Top container above the app bar
          Container(
            color: Colors.orange,
            width: double.infinity,
            padding: EdgeInsets.all(16),
            child: Text(
              'Top Container Content',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),

          // Custom AppBar using PreferredSize
          PreferredSize(
            preferredSize: Size.fromHeight(kToolbarHeight),
            child: AppBar(
              title: Text("Custom AppBar"),
              automaticallyImplyLeading: false,
            ),
          ),

          // Expanded body with scrollable content
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: List.generate(
                  30,
                  (index) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Text("Item ${index + 1}"),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: Icon(Icons.menu, color: Colors.white),
          actions: [
            Icon(Icons.account_circle, color: Colors.white),
          ],
          centerTitle: true,
          title: Image.asset('assets/logo.png', height: 40), // Replace with your logo
          backgroundColor: Colors.black,
        ),
        body: Container(
          color: Colors.black,
          child: Column(
            children: [
              Expanded(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 50,
                        backgroundImage: AssetImage('assets/angelina.jpg'), // Replace with actual image
                      ),
                      SizedBox(height: 16),
                      Text(
                        'Angelina, 28',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Ralph',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(height: 32),
                      Text(
                        'Stroll Question',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 16),
                      Text(
                        'What is your favorite time of the day?',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(height: 24),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                        decoration: BoxDecoration(
                          color: Colors.grey[800],
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          '"Mine is definitely the peace in the morning."',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ),
                      SizedBox(height: 16),
                      Text(
                        '00:00',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                          padding: EdgeInsets.symmetric(vertical: 16),
                        ),
                        child: Text('Delete'),
                      ),
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          padding: EdgeInsets.symmetric(vertical: 16),
                        ),
                        child: Text('Submit'),
                      ),
                    ),
                  ],
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  'Unmatch',
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 16,
                  ),
                ),
              ),
              SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
