// ignore_for_file: unnecessary_new, prefer_const_constructors, deprecated_member_use, use_build_context_synchronously

import "dart:io";
import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:image_picker/image_picker.dart";
import 'dart:convert';

import "package:sn_progress_dialog/progress_dialog.dart";

import "../../models/response_api.dart";
import "../../models/user.dart";
import "../../provider/users_provider.dart";
import "../../utils/my_snackbar.dart";

class RegisterController {
  BuildContext? context;
  TextEditingController emailController = new TextEditingController();
  TextEditingController nameController = new TextEditingController();
  TextEditingController lastNameController = new TextEditingController();
  //TextEditingController phoneController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  TextEditingController confirmPasswordController = new TextEditingController();
  Function? refresh;

  bool isEnable = true;

  ProgressDialog? _progressDialog;

  UsersProvider usersProvider = new UsersProvider();

  Future? init(BuildContext context, Function refresh) async {
    this.context = context;
    this.refresh = refresh;
    await usersProvider.init(context);
    _progressDialog = ProgressDialog(context: context);
    refresh();
  }

  void register() async {
    String email = emailController.text.trim();
    String firstName = nameController.text.trim();
    String lastName = lastNameController.text.trim();
    //String phone = phoneController.text.trim();
    String password1 = passwordController.text.trim();
    String password2 = confirmPasswordController.text.trim();

    if (email.isEmpty ||
        firstName.isEmpty ||
        lastName.isEmpty ||
        //phone.isEmpty ||
        password1.isEmpty ||
        password2.isEmpty) {
      MySnackbar.show(context!, 'Debes ingresar todos los campos');
      return;
    }

    if (password1 != password2) {
      MySnackbar.show(context!, 'Las contraseñas no coinciden');
      return;
    }

    User user = new User(
        email: email,
        firstName: firstName,
        lastName: lastName,
        password1: password1,
        password2: password2);

    _progressDialog!.show(max: 100, msg: 'Creando el usuario');
    isEnable = false;

    ResponseApi? responseApi = await usersProvider.create(user);

    MySnackbar.show(context!, responseApi?.message);
    _progressDialog!.close();

    if (responseApi!.succes == true) {
      Future.delayed(const Duration(seconds: 3), () {
        Get.offAllNamed('/login');
      });
    } else {
      isEnable = true;
    }

    print('Respuesta al crear usuario sin imagen : ${responseApi.toJson()}');
  }
}
