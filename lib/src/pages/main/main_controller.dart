// ignore_for_file: prefer_final_fields, unnecessary_new, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tascd/src/provider/verse_provider.dart';

import '../../models/response_api.dart';
import '../../models/user.dart';
import '../../models/verse.dart';
import '../../utils/shared_pref.dart';

class MainController {
  BuildContext? context;
  SharedPref _sharedPref = new SharedPref();
  GlobalKey<ScaffoldState> key = new GlobalKey<ScaffoldState>();
  Function? refresh;
  String? htmlData;

  VerseProvider verseProvider = new VerseProvider();

  User? user;

  Future? init(BuildContext context, Function refresh) async {
    this.context = context;
    this.refresh = refresh;
    user = User.fromJson(await _sharedPref.read('user'));
    await verseProvider.init(context, user!);
    await getVerse();
    refresh();
  }

  void logout() {
    _sharedPref.logout(context!);
  }

  void openDrawer() {
    key.currentState!.openDrawer();
  }

  void goToProfile() {
    Get.offAllNamed('/profile');
  }

  void goToDiary() {
    Get.offAllNamed('/diary');
  }

  void goToConfiguration() {
    Get.offAllNamed('/configuration');
  }

  void goToPampe() {
    Get.toNamed('/pampe');
  }

  getVerse() async {
    ResponseApi? responseApi = await verseProvider.getVerse();
    Verse verse = Verse.fromJson(responseApi!.data as Map<String, dynamic>);
    htmlData = verse.htmil;
    print('la data dentro del verso es : ${verse.htmil}');
  }
}
