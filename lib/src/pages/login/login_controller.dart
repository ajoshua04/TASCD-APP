// ignore_for_file: unnecessary_new, prefer_final_fields, use_build_context_synchronously

import "package:flutter/material.dart";
import "package:get/get.dart";

import "../../models/response_api.dart";
import "../../models/user.dart";
import "../../provider/users_provider.dart";
import "../../utils/my_snackbar.dart";
import "../../utils/shared_pref.dart";

class LoginController {
  BuildContext? context;
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

  UsersProvider usersProvider = new UsersProvider();
  SharedPref _sharedPref = new SharedPref();

  Future? init(BuildContext context) async {
    this.context = context;
    await usersProvider.init(context);
    User user = User.fromJson(await _sharedPref.read('user') ?? {});
    if (user.accessToken != null) {
      Get.offAllNamed('/main');
    }
  }

  void goToRegsiterPage() {
    Get.toNamed('/register');
  }

  void login() async {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    ResponseApi? responseApi = await usersProvider.login(email, password);

    if (responseApi!.userLoginDto != null) {
      User user =
          User.fromJson(responseApi.userLoginDto as Map<String, dynamic>);
      _sharedPref.save('user', user.toJson());
      Get.offAllNamed('/main');
    }
    MySnackbar.show(context!, responseApi.message);
  }
}
