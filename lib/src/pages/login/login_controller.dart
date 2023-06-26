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
  Function? refresh;

  bool isFetching = false;

  Future? init(BuildContext context, Function refresh) async {
    this.context = context;
    this.refresh = refresh;
    await usersProvider.init(context);
    refresh();
  }

  void goToRegsiterPage() {
    Get.toNamed('/register');
  }

  void login() async {
    isFetching = true;
    refresh!();
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    ResponseApi? responseApi = await usersProvider.login(email, password);

    if (responseApi!.userLoginDto != null) {
      Future.delayed(const Duration(seconds: 3), () {
        User user =
            User.fromJson(responseApi.userLoginDto as Map<String, dynamic>);
        _sharedPref.save('user', user.toJson());
        Get.offAllNamed('/main');
      });
    } else {
      isFetching = false;
      refresh!();
    }

    MySnackbar.show(context!, responseApi.message);
  }
}
