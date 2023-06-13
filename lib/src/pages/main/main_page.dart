// ignore_for_file: prefer_const_constructors, unnecessary_new, prefer_final_fields

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:tascd/src/pages/main/main_controller.dart';
import 'package:html_unescape/html_unescape.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../utils/my_colors.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  MainController _con = new MainController();

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
                children: [_tascdText(), _htmlContainer(), _buttonQTDD()],
              ),
            ),
          ],
        ));
  }

  Widget _buttonQTDD() {
    return Container(
        width: double.infinity,
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: ElevatedButton(
            onPressed: () {
              _con.goToPampe();
            },
            child: Text('Que te dijo Dios?')));
  }

  Widget _htmlContainer() {
    return Container(
      padding: const EdgeInsets.all(15),
      margin: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: const [BoxShadow(blurRadius: 1, color: Colors.grey)],
        border: Border.all(color: Colors.grey),
      ),
      child: Html(
        data: _con.htmlData ?? '<h1>Cargando...</h1>',
        style: {
          "body": Style(
            fontSize: FontSize(15.0),
            fontFamily: 'Roboto',
          ),
          "*": Style(color: Colors.black),
        },
        onLinkTap: (url, attributes, element) async {
          await launchUrl(Uri.parse(url!),
              mode: LaunchMode.externalApplication);
        },
      ),
    );
  }

  Widget _tascdText() {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Text(
        'TASCD',
        style: TextStyle(
          fontSize: 30,
        ),
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
                      _drawerItem(
                          color: Colors.black54,
                          name: 'Perfil',
                          icon: Icons.person_pin_rounded,
                          onPressed: () => {_con.goToProfile()}),
                      const SizedBox(
                        height: 30,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: MyColors.primaryOpacityColor,
                        ),
                        child: _drawerItem(
                            color: Colors.black26,
                            name: 'Mi TASCD',
                            icon: Icons.coffee,
                            onPressed: () => {}),
                      ),
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