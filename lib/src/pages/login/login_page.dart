// ignore_for_file: prefer_const_constructors, library_private_types_in_public_api, sized_box_for_whitespace, prefer_const_literals_to_create_immutables, prefer_final_fields

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:lottie/lottie.dart';

import '../../utils/my_colors.dart';
import 'login_controller.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  LoginController _con = LoginController();

  @override
  void initState() {
    super.initState();

    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      _con.init(context, refresh);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        width: double.infinity,
        child: Stack(
          children: [
            Positioned(top: -80, left: -100, child: _circleLogin()),
            Positioned(top: 60, left: 25, child: _textLogin()),
            Column(
              children: [
                _imageBanner(),
                //_lottieAnimation(),
                _textFieldEmail(),
                _textFieldPassword(),
                _buttonLogin(),
                _textDontHaveAccount()
              ],
            ),
            _progressIndicator(),
          ],
        ),
      ),
    ));
  }

  void refresh() {
    setState(() {});
  }

  Widget _lottieAnimation() {
    return Container(
      margin: EdgeInsets.only(
          top: 120, bottom: MediaQuery.of(context).size.height * 0.17),
      child: Lottie.asset('assets/json/delivery.json',
          width: 350, height: 200, fit: BoxFit.fill),
    );
  }

  Widget _progressIndicator() {
    return _con.isFetching
        ? Padding(
            padding: const EdgeInsets.only(top: 250.0),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: MyColors.primaryOpacityColor),
              padding: const EdgeInsets.all(50),
              margin: const EdgeInsets.all(50),
              child: Center(
                child: const CircularProgressIndicator(),
              ),
            ),
          )
        : Container();
  }

  Widget _buttonLogin() {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 50, vertical: 30),
      child: ElevatedButton(
        onPressed: _con.isFetching
            ? null
            : () {
                _con.login();
              },
        style: ElevatedButton.styleFrom(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            padding: EdgeInsets.symmetric(vertical: 15)),
        child: Text("INGRESAR"),
      ),
    );
  }

  Widget _textFieldEmail() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 50, vertical: 5),
      decoration: BoxDecoration(
          color: MyColors.primaryOpacityColor,
          borderRadius: BorderRadius.circular(50)),
      child: TextField(
        controller: _con.emailController,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
            hintText: 'Correo Electronico',
            border: InputBorder.none,
            contentPadding: EdgeInsets.all(15),
            hintStyle: TextStyle(color: MyColors.primaryColorDark),
            prefixIcon: Icon(
              Icons.email,
              color: MyColors.primaryColor,
            )),
      ),
    );
  }

  Widget _textFieldPassword() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 50, vertical: 5),
      decoration: BoxDecoration(
          color: MyColors.primaryOpacityColor,
          borderRadius: BorderRadius.circular(50)),
      child: TextField(
        controller: _con.passwordController,
        obscureText: true,
        decoration: InputDecoration(
            hintText: 'Contraseña',
            border: InputBorder.none,
            contentPadding: EdgeInsets.all(15),
            hintStyle: TextStyle(color: MyColors.primaryColorDark),
            prefixIcon: Icon(
              Icons.lock,
              color: MyColors.primaryColor,
            )),
      ),
    );
  }

  Widget _textLogin() {
    return Text(
      "LOGIN",
      style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 22,
          fontFamily: 'NimbusSans'),
    );
  }

  Widget _circleLogin() {
    return Stack(
      children: [
        Container(
          width: 240,
          height: 230,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: MyColors.primaryColor),
        ),
      ],
    );
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

  Widget _textDontHaveAccount() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'No tienes cuenta?',
          style: TextStyle(color: MyColors.primaryColor),
        ),
        SizedBox(
          width: 7,
        ),
        GestureDetector(
          onTap: () {
            _con.goToRegsiterPage();
          },
          child: Text(
            'Registrate',
            style: TextStyle(
                fontWeight: FontWeight.bold, color: MyColors.primaryColor),
          ),
        )
      ],
    );
  }
}
