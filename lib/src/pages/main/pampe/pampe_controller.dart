// ignore_for_file: prefer_final_fields, unnecessary_new, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tascd/src/provider/diaries_provider.dart';

import '../../../models/response_api.dart';
import '../../../models/user.dart';
import '../../../utils/my_snackbar.dart';
import '../../../utils/shared_pref.dart';

class PampeController {
  BuildContext? context;
  SharedPref _sharedPref = new SharedPref();
  GlobalKey<ScaffoldState> key = new GlobalKey<ScaffoldState>();
  Function? refresh;
  DiariesProvider diariesProvider = new DiariesProvider();

  User? user;

  Future? init(BuildContext context, Function refresh) async {
    this.context = context;
    this.refresh = refresh;
    user = User.fromJson(await _sharedPref.read('user'));
    refresh();
    await diariesProvider.init(context, user!);
    refresh();
  }

  void logout() {
    _sharedPref.logout(context!);
  }

  void openDrawer() {
    key.currentState!.openDrawer();
  }

  void goToConfguration() {
    Get.offAllNamed('/configuration');
  }

  void goToProfile() {
    Get.offAllNamed('/profile');
  }

  void goToDiary() {
    Get.offAllNamed('/diary');
  }

  void goToMain() {
    Get.offAllNamed('/main');
  }

  void createDiary(String qttd, String userId) async {
    ResponseApi? responseApi = await diariesProvider.createDiary(qttd, userId);

    MySnackbar.show(context!, responseApi?.message);

    if (responseApi!.message == 'OK') {
      Get.back();
    }
  }
}
