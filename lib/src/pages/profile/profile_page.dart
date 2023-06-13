// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:tascd/src/pages/profile/profile_controller.dart';

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
        key: _con.key,
        appBar: AppBar(),
        drawer: _drawer(),
        body: Stack(
          children: [
            Container(
                decoration: BoxDecoration(
              image: const DecorationImage(
                  image: AssetImage("assets/images/background_qtdd.png"),
                  fit: BoxFit.fill),
              color: Colors.white,
            )),
            SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        top: 20.0,
                        left: (MediaQuery.of(context).size.height * 0.20)),
                    child: Text(
                      'Perfil',
                      style: TextStyle(
                        fontSize: 30,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
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
        height: 40,
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
            Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.53,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 90.0),
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
                        height: 20,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: MyColors.primaryOpacityColor,
                        ),
                        child: _drawerItem(
                            color: Colors.black26,
                            name: 'Perfil',
                            icon: Icons.person_pin_rounded,
                            onPressed: () => {()}),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      _drawerItem(
                          color: Colors.black54,
                          name: 'Mi TASCD',
                          icon: Icons.coffee,
                          onPressed: () => {_con.goToMain()}),
                      const SizedBox(
                        height: 30,
                      ),
                      _drawerItem(
                          color: Colors.black54,
                          name: 'Mi Diario',
                          icon: Icons.menu_book,
                          onPressed: () => {_con.goToDiary()}),
                      const SizedBox(
                        height: 30,
                      ),
                      _drawerItem(
                          color: Colors.black54,
                          name: 'Configuración',
                          icon: Icons.settings,
                          onPressed: () => {_con.goToConfguration()}),
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
                    onPressed: () => {_con.logout()}),
                const SizedBox(
                  height: 30,
                ),
                _drawerItem(
                    color: Colors.red,
                    name: 'Cerrar sesion',
                    icon: Icons.logout,
                    onPressed: () => {_con.logout()}),
              ],
            ),
          ],
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
}
