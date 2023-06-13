// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tascd/src/pages/configuration/configuration_page.dart';
import 'package:tascd/src/pages/diary/diary_page.dart';
import 'package:tascd/src/pages/login/login_page.dart';
import 'package:tascd/src/pages/main/main_page.dart';
import 'package:tascd/src/pages/main/pampe/pampe_page.dart';
import 'package:tascd/src/pages/profile/profile_page.dart';
import 'package:tascd/src/pages/register/register_page.dart';
import 'package:tascd/src/utils/my_colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "App TASCD",
      debugShowCheckedModeBanner: false,
      initialRoute: '/login',
      getPages: [
        GetPage(
            name: '/login',
            page: (() => LoginPage()),
            transition: Transition.native),
        GetPage(
            name: '/register',
            page: (() => RegisterPage()),
            transition: Transition.native),
        GetPage(
            name: '/main',
            page: (() => MainPage()),
            transition: Transition.native),
        GetPage(
            name: '/configuration',
            page: (() => ConfigurationPage()),
            transition: Transition.native),
        GetPage(
            name: '/diary',
            page: (() => DiaryPage()),
            transition: Transition.native),
        GetPage(
            name: '/profile',
            page: (() => ProfilePage()),
            transition: Transition.native),
        GetPage(
            name: '/pampe',
            page: (() => PampePage()),
            transition: Transition.native),
      ],
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSwatch().copyWith(primary: MyColors.primaryColor),
      ),
    );
  }
}
