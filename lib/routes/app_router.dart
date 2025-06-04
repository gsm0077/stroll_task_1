// app_router.dart
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:stroll/presentation/auth/screens/login_screens.dart';
import 'package:stroll/presentation/chats/screens/chat_start_ui.dart';
import 'package:stroll/presentation/chats/screens/single_chat_screen.dart.dart';
import 'package:stroll/presentation/main_navigation/widgets/defaultwidget.dart';
import 'package:stroll/routes/routes_list.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const DefaultBottomWidget(),
    ),
    // GoRoute(
    //   path: RoutesList.defaultBottom,
    //   builder: (context, state) => DefaultBottomWidget(),
    // ),
    GoRoute(
      path: RoutesList.singleChatScreen,
      pageBuilder: (context, state) {
        return CupertinoPage(
          key: state.pageKey,
          child: SingleChatScreen(),
        );
      },
    ),
    GoRoute(
      path: RoutesList.chatStartUi,
      builder: (context, state) => ChatStartUi(),
    ),
    // GoRoute(
    //   path: RoutesList.chatStartUi,
    //   pageBuilder: (context, state) {
    //     return CupertinoPage(
    //       key: state.pageKey,
    //       child: ,
    //     );
    //   },
    // ),
  ],
);
