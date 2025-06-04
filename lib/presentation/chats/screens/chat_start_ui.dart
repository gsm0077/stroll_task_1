import 'package:flutter/material.dart';
import 'package:stroll/core/constants/app_colors.dart';
import 'package:stroll/gen/assets.gen.dart';

class ChatStartUi extends StatefulWidget {
  const ChatStartUi({super.key});

  @override
  State<ChatStartUi> createState() => _ChatStartUiState();
}

class _ChatStartUiState extends State<ChatStartUi> {
  bool overlayDissapear = false;
  double initialOpacity = 0;
  double initialScale = 0.85;
  double imageScaled = 1; //1 to 1.08
  double intialBgOpacity = 0;
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
  }

  @override
  Widget build(BuildContext context) {
    final topPadding = MediaQuery.of(context).padding.top;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Hero(
        tag: "imageScale",
        child: Stack(
          children: [
            Positioned.fill(
              child: AnimatedOpacity(
                opacity: intialBgOpacity,
                duration: Duration(seconds: 1, microseconds: 500),
                child: AnimatedScale(
                  scale: imageScaled,
                  duration: Duration(seconds: 1, microseconds: 500),
                  curve: Curves.easeInOut,
                  child: Image.asset(
                    Assets.jpg.bgChat.path,
                    fit: BoxFit.cover,
                  ),
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
                    height: 60, // 👈 set your custom height here
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                        Text('John Doe, 28',
                            style: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold)),
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
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            AnimatedScale(
                              scale: initialScale,
                              duration: Duration(milliseconds: 700),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Stack(
                                    clipBehavior: Clip.none,
                                    children: [
                                      Container(
                                        width: 65,
                                        height: 65,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            width: 8,
                                            color: Color(0xff0D0F11),
                                          ),
                                          borderRadius: BorderRadius.circular(100),
                                          image: DecorationImage(
                                            image: AssetImage(Assets.pngs.joey.path),
                                            // fit: BoxFit.fill, // Or use BoxFit.contain/cover/fill
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        bottom: -2,
                                        child: Container(
                                          decoration: BoxDecoration(
                                              color: Colors.grey, borderRadius: BorderRadius.circular(16)),
                                          padding: EdgeInsets.symmetric(vertical: 2, horizontal: 5),
                                          child: Text(
                                            'Stroll Question',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: Color(0xffF5F5F5), fontWeight: FontWeight.bold, fontSize: 8),
                                            softWrap: true,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    'What is your favorite time of the day?',
                                    textAlign: TextAlign.center,
                                    style:
                                        TextStyle(color: Color(0xffF5F5F5), fontWeight: FontWeight.bold, fontSize: 25),
                                    softWrap: true,
                                  ),
                                  Text(
                                    "“Mine is definitely the peace in the morning.”",
                                    softWrap: true,
                                    textAlign: TextAlign.center,
                                    style:
                                        TextStyle(fontSize: 14, fontStyle: FontStyle.italic, color: Color(0xffCBC9FF)),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 30.0),
                              child: Text(
                                "00:00",
                                softWrap: true,
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 14, color: Color(0xffCBC9FF)),
                              ),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Divider(
                              height: 0.5,
                              color: Colors.grey,
                            ),
                            SizedBox(
                              height: 50,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center, // centers vertically
                              children: [
                                TextButton(
                                  onPressed: () {
                                    // Text button action
                                  },
                                  child: Text(
                                    'Delete',
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                ),
                                // Outer circle (slightly larger with white border)
                                Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    // Outer Circle
                                    Container(
                                      width: 80,
                                      height: 80,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(color: Colors.white, width: 2),
                                        color: Colors.grey.shade300,
                                      ),
                                    ),
                                    // Inner Circle with Camera Button
                                    InkWell(
                                      onTap: () {
                                        // Camera tap action
                                      },
                                      borderRadius: BorderRadius.circular(25),
                                      child: Container(
                                        width: 70,
                                        height: 70,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(width: 5, color: Colors.black),
                                          color: AppColors.baseViolet,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),

                                // Text Button
                                TextButton(
                                  onPressed: () {
                                    // Text button action
                                  },
                                  child: Text(
                                    'Submit',
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                ),
                              ],
                            ),
                            TextButton(
                              onPressed: () {
                                // Text button action
                              },
                              child: Text(
                                'UnMatch',
                                style: TextStyle(color: Colors.red[700]),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
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
