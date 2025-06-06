// app_router.dart
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:stroll/presentation/chats/screens/chat_screen_single.dart';
import 'package:stroll/presentation/chats/screens/chat_start_ui.dart';
import 'package:stroll/presentation/main_navigation/widgets/defaultWidget.dart';
import 'package:stroll/routes/routes_list.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const DefaultBottomWidget(),
    ),
    GoRoute(
      path: RoutesList.chatStartUi,
      builder: (context, state) => ChatStartUi(),
    ),
    GoRoute(
      path: RoutesList.chatScreenSingle,
      pageBuilder: (context, state) {
        return CupertinoPage(
          key: state.pageKey,
          child: ChatScreenSingle(),
        );
      },
    ),
  ],
);
