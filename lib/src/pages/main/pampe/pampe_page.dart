// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_field, prefer_final_fields, unnecessary_new

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_quill/flutter_quill.dart' as quill;
import 'package:tascd/src/pages/main/pampe/pampe_controller.dart';

import '../../../utils/my_colors.dart';

class PampePage extends StatefulWidget {
  const PampePage({super.key});

  @override
  State<PampePage> createState() => _PampePageState();
}

class _PampePageState extends State<PampePage> {
  PampeController _con = new PampeController();
  quill.QuillController _controller = quill.QuillController.basic();

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
        //key: _con.key,
        appBar: AppBar(),
        drawer: _drawer(),
        body: Stack(
          children: [
            Container(
                decoration: BoxDecoration(
              image: const DecorationImage(
                  image: AssetImage("assets/images/background_pampe.png"),
                  fit: BoxFit.fill),
              color: Colors.white,
            )),
            SingleChildScrollView(
              child: Column(
                children: [
                  _containerPampe(),
                  _textQTDD(),
                  _quillKit(),
                  _buttonGuardar()
                ],
              ),
            ),
          ],
        ));
  }

  Widget _buttonGuardar() {
    return Container(
        width: double.infinity,
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: ElevatedButton(onPressed: () {}, child: Text('Guardar')));
  }

  Widget _quillKit() {
    return Padding(
      padding: const EdgeInsets.only(top: 18.0),
      child: Column(
        children: [
          quill.QuillToolbar.basic(controller: _controller),
          Container(
            alignment: Alignment.topLeft,
            width: double.infinity,
            padding: const EdgeInsets.all(15),
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: const [BoxShadow(blurRadius: 1, color: Colors.grey)],
              border: Border.all(color: Colors.grey),
            ),
            height: 500,
            child: quill.QuillEditor.basic(
              controller: _controller,
              readOnly: false, // true for view only mode
            ),
          )
        ],
      ),
    );
  }

  Widget _textQTDD() {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0),
      child: Align(
          alignment: Alignment.topLeft,
          child: Text(
            '¿Qué te dijo Dios?',
            style: TextStyle(fontSize: 17),
          )),
    );
  }

  Widget _containerPampe() {
    return Container(
      alignment: Alignment.topLeft,
      width: double.infinity,
      padding: const EdgeInsets.all(15),
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: const [BoxShadow(blurRadius: 1, color: Colors.grey)],
        border: Border.all(color: Colors.grey),
      ),
      child: Column(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              'Toma nota de tus conversaciones con Dios',
              style: TextStyle(
                  color: const Color.fromARGB(255, 95, 95, 95), fontSize: 13),
            ),
          ),
          SizedBox(
            height: 6,
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              '¿Señor que me quieres decir hoy?',
              style:
                  TextStyle(color: Color.fromARGB(255, 0, 0, 0), fontSize: 18),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              '¿Qué te habló Dios?',
              style: TextStyle(
                  color: Color.fromARGB(255, 126, 126, 126), fontSize: 16),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              '¿Cómo esto cambiará tus perspectivas?',
              style: TextStyle(
                  color: Color.fromARGB(255, 126, 126, 126), fontSize: 16),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              '¿Cómo aplicará esto en tu vida diaria?',
              style: TextStyle(
                  color: Color.fromARGB(255, 126, 126, 126), fontSize: 16),
            ),
          ),
          SizedBox(
            height: 25,
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              'PAMPE:',
              style: TextStyle(color: Colors.grey[800], fontSize: 16),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Row(
              children: [
                Text(
                  'P - ',
                  style: TextStyle(color: Colors.grey[800], fontSize: 16),
                ),
                Text(
                  '¿Pecados que debo confesar?',
                  style: TextStyle(color: Colors.grey[600], fontSize: 16),
                )
              ],
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Row(
              children: [
                Text(
                  'A - ',
                  style: TextStyle(color: Colors.grey[800], fontSize: 16),
                ),
                Text(
                  '¿Actitudes que debo adoptar?',
                  style: TextStyle(color: Colors.grey[600], fontSize: 16),
                )
              ],
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Row(
              children: [
                Text(
                  'M - ',
                  style: TextStyle(color: Colors.grey[800], fontSize: 16),
                ),
                Text(
                  '¿Mandamientos que debo obedecer?',
                  style: TextStyle(color: Colors.grey[600], fontSize: 16),
                )
              ],
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Row(
              children: [
                Text(
                  'P - ',
                  style: TextStyle(color: Colors.grey[800], fontSize: 16),
                ),
                Text(
                  '¿Promesas que debo reclamar?',
                  style: TextStyle(color: Colors.grey[600], fontSize: 16),
                )
              ],
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Row(
              children: [
                Text(
                  'E - ',
                  style: TextStyle(color: Colors.grey[800], fontSize: 16),
                ),
                Text(
                  '¿Ejemplos que debo seguir o evitar?',
                  style: TextStyle(color: Colors.grey[600], fontSize: 16),
                )
              ],
            ),
          ),
        ],
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
                          onPressed: () => {()}),
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
