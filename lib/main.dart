// ignore_for_file: prefer_const_constructors, unnecessary_new, prefer_final_fields

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tascd/splash.dart';
import 'package:tascd/src/models/user.dart';
import 'package:tascd/src/pages/configuration/configuration_page.dart';
import 'package:tascd/src/pages/diary/detail/diary_detail_page.dart';
import 'package:tascd/src/pages/diary/diary_page.dart';
import 'package:tascd/src/pages/login/login_page.dart';
import 'package:tascd/src/pages/main/main_page.dart';
import 'package:tascd/src/pages/main/pampe/pampe_page.dart';
import 'package:tascd/src/pages/profile/profile_page.dart';
import 'package:tascd/src/pages/register/register_page.dart';
import 'package:tascd/src/utils/app_theme.dart';
import 'package:tascd/src/utils/shared_pref.dart';

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
      initialRoute: '/splash',
      getPages: [
        GetPage(
            name: '/splash',
            page: (() => Splash()),
            transition: Transition.rightToLeft),
        GetPage(
            name: '/login',
            page: (() => LoginPage()),
            transition: Transition.rightToLeft),
        GetPage(
            name: '/register',
            page: (() => RegisterPage()),
            transition: Transition.rightToLeft),
        GetPage(
            name: '/main',
            page: (() => MainPage()),
            transition: Transition.rightToLeft),
        GetPage(
            name: '/configuration',
            page: (() => ConfigurationPage()),
            transition: Transition.rightToLeft),
        GetPage(
            name: '/diary',
            page: (() => DiaryPage()),
            transition: Transition.rightToLeft),
        GetPage(
            name: '/profile',
            page: (() => ProfilePage()),
            transition: Transition.rightToLeft),
        GetPage(
            name: '/pampe',
            page: (() => PampePage()),
            transition: Transition.rightToLeft),
        GetPage(
            name: '/diary/detail',
            page: (() => DiaryDetail()),
            transition: Transition.rightToLeft),
      ],
      theme: AppTheme(selectedColor: 0).theme(),
    );
  }
}
