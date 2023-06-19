// ignore_for_file: prefer_final_fields, unnecessary_new, use_build_context_synchronously, await_only_futures

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tascd/src/models/diary.dart';
import 'package:tascd/src/models/diary_response.dart';
import 'package:tascd/src/provider/diaries_provider.dart';

import '../../models/response_api.dart';
import '../../models/user.dart';
import '../../utils/shared_pref.dart';

class DiaryController {
  BuildContext? context;
  SharedPref _sharedPref = new SharedPref();
  GlobalKey<ScaffoldState> key = new GlobalKey<ScaffoldState>();
  Function? refresh;
  DiaryResponseApi? diaryResponseApi;
  List<Diary>? diaries;

  DiariesProvider diariesProvider = new DiariesProvider();

  User? user;

  Future? init(BuildContext context, Function refresh) async {
    this.context = context;
    this.refresh = refresh;
    user = User.fromJson(await _sharedPref.read('user'));
    refresh();
    await diariesProvider.init(context, user!);
    await getDiaries();
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

  void goToMain() {
    key.currentState!.closeDrawer();
    Get.offAllNamed('/main');
  }

  void goToConfiguration() {
    key.currentState!.closeDrawer();
    Get.offAllNamed('/configuration');
  }

  void goToDetail(Diary diary) {
    Get.toNamed('/diary/detail', arguments: [
      {'diary': diary}
    ]);
  }

  getDiaries() async {
    diaryResponseApi = await diariesProvider.getDiaries();

    diaries = diaryResponseApi!.diaries;

    print('el primer diario es : ${diaries![0].verseHtml}');
  }
}
