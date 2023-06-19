// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:tascd/src/pages/profile/profile_controller.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../utils/my_colors.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  ProfileController _con = new ProfileController();

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      _con.init(context, refresh);
    });
    refresh();
  }

  void refresh() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[100],
        key: _con.key,
        appBar: AppBar(),
        drawer: _drawer(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              _imageProfile(),
              _containerInfo(),
              _containerDivider(),
              _buttonEditProfile(),
              _buttonForgotPassword(),
              _buttonDeleteProfile()
            ],
          ),
        ));
  }

  Widget _imageProfile() {
    return Container(
      alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.only(top: 30.0),
        child: CircleAvatar(
          radius: 70,
          backgroundImage: AssetImage('assets/images/user-profile.jpg'),
        ),
      ),
    );
  }

  Widget _containerInfo() {
    return Container(
      padding: EdgeInsets.only(top: 70, left: 40),
      alignment: Alignment.topLeft,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Align(
              alignment: Alignment.topLeft,
              child: Text(
                _con.user!.firstName!,
                style: TextStyle(fontSize: 20),
              )),
          SizedBox(
            height: 25,
          ),
          Align(
              alignment: Alignment.topLeft,
              child:
                  Text(_con.user!.lastName!, style: TextStyle(fontSize: 20))),
          SizedBox(
            height: 25,
          ),
          Align(
              alignment: Alignment.topLeft,
              child: Text(_con.user!.email!, style: TextStyle(fontSize: 20))),
        ],
      ),
    );
  }

  Widget _buttonEditProfile() {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            padding: EdgeInsets.symmetric(vertical: 15),
            backgroundColor: MyColors.primaryColor),
        child: Text("Editar"),
      ),
    );
  }

  Widget _buttonDeleteProfile() {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            padding: EdgeInsets.symmetric(vertical: 15),
            backgroundColor: Colors.red),
        child: Text("Eliminar mi cuenta "),
      ),
    );
  }

  Widget _buttonForgotPassword() {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            padding: EdgeInsets.symmetric(vertical: 15),
            backgroundColor: Colors.white,
            foregroundColor: MyColors.primaryColor),
        child: Text("Olvidé mi contraseña"),
      ),
    );
  }

  Widget _containerDivider() {
    return Padding(
      padding: EdgeInsets.only(top: 70, bottom: 40),
      child: const Divider(
        thickness: 1,
        height: 10,
        color: Colors.grey,
      ),
    );
  }

  Widget _drawerItem(
      {required Color color,
      required String name,
      required IconData icon,
      required Function() onPressed,
      Key? key}) {
    return InkWell(
      onTap: onPressed,
      child: SizedBox(
        height: 50,
        child: Padding(
          padding: const EdgeInsets.only(left: 15.0),
          child: Row(
            children: [
              Icon(
                icon,
                size: 18,
                color: color,
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                name,
                style: TextStyle(fontSize: 18, color: color),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget headerWidget() {
    return Row(
      children: [
        const CircleAvatar(
          radius: 40,
          backgroundImage: AssetImage('assets/images/user-profile.jpg'),
        ),
        const SizedBox(
          width: 20,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 44),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('${_con.user?.firstName} ${_con.user?.lastName}',
                  style: TextStyle(fontSize: 14, color: Colors.white)),
              SizedBox(
                height: 10,
              ),
              Text('${_con.user?.email}',
                  style: TextStyle(fontSize: 14, color: Colors.white)),
              Divider(
                thickness: 5,
                height: 10,
                color: Colors.grey,
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget _drawer() {
    return Drawer(
      child: Material(
        color: Colors.white,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
                decoration: BoxDecoration(color: MyColors.primaryColor),
                child: headerWidget()),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.53,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 83.0, vertical: 10),
                          child: ElevatedButton(
                              onPressed: () {},
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.local_fire_department_outlined,
                                    size: 22,
                                    color: Colors.orangeAccent[400],
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text('0 RACHA'),
                                ],
                              )),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: MyColors.primaryOpacityColor,
                              borderRadius: BorderRadius.circular(20)),
                          child: _drawerItem(
                              color: Colors.black26,
                              name: 'Perfil',
                              icon: Icons.coffee,
                              onPressed: () => {}),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        _drawerItem(
                            color: Colors.black54,
                            name: 'Mi TASCD',
                            icon: Icons.coffee,
                            onPressed: () => {_con.goToMain()}),
                        const SizedBox(
                          height: 10,
                        ),
                        _drawerItem(
                            color: Colors.black54,
                            name: 'Mi Diario',
                            icon: Icons.menu_book,
                            onPressed: () => {_con.goToDiary()}),
                        const SizedBox(
                          height: 10,
                        ),
                        _drawerItem(
                            color: Colors.black54,
                            name: 'Configuración',
                            icon: Icons.settings,
                            onPressed: () => {_con.goToConfiguration()}),
                      ],
                    ),
                  ),
                  const Divider(
                    thickness: 1,
                    height: 10,
                    color: Colors.grey,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  _drawerItem(
                      color: Colors.black54,
                      name: 'Donaciones',
                      icon: Icons.cases_rounded,
                      onPressed: () => {
                            launchUrl(Uri.parse('https://cbint.org/donaciones'),
                                mode: LaunchMode.externalApplication)
                          }),
                  const SizedBox(
                    height: 10,
                  ),
                  _drawerItem(
                      color: Colors.red,
                      name: 'Cerrar sesion',
                      icon: Icons.logout,
                      onPressed: () => {_con.logout()}),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
