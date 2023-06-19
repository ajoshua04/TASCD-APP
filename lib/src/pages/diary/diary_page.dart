// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:lottie/lottie.dart';
import 'package:tascd/src/models/diary.dart';
import 'package:tascd/src/pages/diary/diary_controller.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../utils/my_colors.dart';

class DiaryPage extends StatefulWidget {
  const DiaryPage({super.key});

  @override
  State<DiaryPage> createState() => _DiaryPageState();
}

class _DiaryPageState extends State<DiaryPage> {
  DiaryController _con = new DiaryController();

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
                  _con.diaries != null
                      ? ListView(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          children: _con.diaries != null
                              ? _con.diaries!.map((Diary diary) {
                                  return _containerDiary(diary);
                                }).toList()
                              : [])
                      : _loadingWidget()
                ],
              ),
            )
          ],
        ));
  }

  Widget _loadingWidget() {
    return Container(
      height: 300,
      width: double.infinity,
      padding: const EdgeInsets.all(15),
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(blurRadius: 1, color: Color.fromARGB(255, 230, 227, 227))
        ],
        border: Border.all(color: Colors.grey),
      ),
      child: Lottie.asset(
        'assets/json/loading_widget.json',
        width: 100,
        height: 100,
      ),
    );
  }

  Widget _containerDiary(Diary? diary) {
    return GestureDetector(
      onTap: () {
        _con.goToDetail(diary);
      },
      child: Container(
          padding: const EdgeInsets.all(15),
          margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  blurRadius: 1, color: Color.fromARGB(255, 230, 227, 227))
            ],
            border: Border.all(color: Colors.grey),
          ),
          child: Column(
            children: [
              Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    diary!.verseDate!,
                    style: TextStyle(
                        color: const Color.fromARGB(255, 95, 95, 95),
                        fontSize: 13),
                  )),
              Html(
                  data: (diary.verseHtml!.split('href="https://')[0]).substring(
                      0,
                      ((diary.verseHtml!.split('href="https://')[0]).length) -
                          14)),
              const Divider(
                thickness: 1,
                height: 10,
                color: Colors.grey,
              ),
              Html(
                data: diary.qtdd!,
                style: {
                  "*": Style(color: Colors.grey),
                },
              ),
            ],
          )),
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
                        _drawerItem(
                            color: Colors.black54,
                            name: 'Perfil',
                            icon: Icons.person_pin_rounded,
                            onPressed: () => {_con.goToProfile()}),
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
                        Container(
                          decoration: BoxDecoration(
                              color: MyColors.primaryOpacityColor,
                              borderRadius: BorderRadius.circular(20)),
                          child: _drawerItem(
                              color: Colors.black26,
                              name: 'Mi Diario',
                              icon: Icons.menu_book,
                              onPressed: () => {}),
                        ),
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
