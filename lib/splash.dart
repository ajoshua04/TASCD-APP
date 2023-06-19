// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tascd/src/models/user.dart';
import 'package:tascd/src/utils/shared_pref.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  SharedPref _sharedPref = new SharedPref();
  @override
  void initState() {
    super.initState();

    _navigateToHome();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _imageBanner(),
        ],
      )),
    );
  }

  _navigateToHome() async {
    User user = User.fromJson(await _sharedPref.read('user') ?? {});
    if (user.accessToken != null) {
      await Future.delayed(Duration(milliseconds: 2000), () {});
      Get.offAllNamed('/main');
    } else {
      await Future.delayed(Duration(milliseconds: 2000), () {});
      Get.offAllNamed('/login');
    }
  }

  Widget _imageBanner() {
    return Container(
      margin: EdgeInsets.only(
          top: 150, bottom: MediaQuery.of(context).size.height * 0.12),
      child: Image.asset(
        'assets/images/logo.jpg',
        width: 200,
        height: 200,
      ),
    );
  }
}
