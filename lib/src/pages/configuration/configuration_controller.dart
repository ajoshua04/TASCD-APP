// ignore_for_file: prefer_final_fields, unnecessary_new, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../models/response_api.dart';
import '../../models/user.dart';
import '../../utils/shared_pref.dart';

class ConfigurationController {
  BuildContext? context;
  SharedPref _sharedPref = new SharedPref();
  GlobalKey<ScaffoldState> key = new GlobalKey<ScaffoldState>();
  Function? refresh;

  User? user;

  Future? init(BuildContext context, Function refresh) async {
    this.context = context;
    this.refresh = refresh;
    user = User.fromJson(await _sharedPref.read('user'));
    refresh();
  }

  void logout() {
    _sharedPref.logout(context!);
  }

  void openDrawer() {
    key.currentState!.openDrawer();
  }

  void goToProfile() {
    key.currentState!.closeDrawer();
    Get.offAllNamed('/profile');
  }

  void goToDiary() {
    key.currentState!.closeDrawer();
    Get.offAllNamed('/diary');
  }

  void goToMain() {
    key.currentState!.closeDrawer();
    Get.offAllNamed('/main');
  }
}
