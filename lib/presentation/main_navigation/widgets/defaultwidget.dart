// login_screen.dart
import 'package:flutter/material.dart';
import 'package:stroll/presentation/chats/screens/chat_start_ui.dart';
import 'package:stroll/presentation/main_navigation/screens/chats_screen.dart';
import 'package:stroll/presentation/main_navigation/screens/flames_screen.dart';
import 'package:stroll/presentation/main_navigation/screens/home_screen.dart';
import 'package:stroll/presentation/main_navigation/widgets/bottom_nav.dart';

class DefaultBottomWidget extends StatefulWidget {
  const DefaultBottomWidget({super.key});

  @override
  State<DefaultBottomWidget> createState() => _DefaultBottomWidgetState();
}

class _DefaultBottomWidgetState extends State<DefaultBottomWidget> {
  @override
  void initState() {
    super.initState();
  }

  void onBottomIconTapped(int value) {
    setState(() {
      currentIndex = value;
    });
  }

  int currentIndex = 1;

  final List<Widget> _pages = [HomeScreen(), FlamesScreen(), ChatsScreen(), ChatStartUi()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.black,
      bottomNavigationBar: BottomNav(currentIndex: currentIndex, onTap: onBottomIconTapped),
      body: _pages[currentIndex],
    );
  }
}
