import 'package:flutter/material.dart';
import 'package:stroll/gen/assets.gen.dart';
import 'package:stroll/gen/fonts.gen.dart';
import 'package:stroll/routes/app_router.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
        theme: ThemeData(
          fontFamily: FontFamily.proximaNova, // 👈 your font family name here
        ),
        title: 'Stroll',
        routerConfig: router);
  }
}
