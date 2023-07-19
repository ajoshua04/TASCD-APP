// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_field, prefer_final_fields, unnecessary_new

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:tascd/src/pages/main/pampe/pampe_controller.dart';
import 'package:html_editor_enhanced/html_editor.dart';
import 'package:quill_html_editor/quill_html_editor.dart';

class PampePage extends StatefulWidget {
  const PampePage({super.key});

  @override
  State<PampePage> createState() => _PampePageState();
}

class _PampePageState extends State<PampePage> {
  PampeController _con = new PampeController();

  HtmlEditorController hcontroller = HtmlEditorController();
  

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
    return Stack(
      children: [
        Container(
            height: double.infinity,
            decoration: BoxDecoration(
              image: const DecorationImage(
                  image: AssetImage("assets/images/background_qtdd.png"),
                  fit: BoxFit.fill),
              color: Colors.grey,
            )),
        Scaffold(
            backgroundColor: Colors.transparent,
            resizeToAvoidBottomInset: true,
            appBar: AppBar(),
            body: Container(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    _containerPampe(),
                    _textQTDD(),
                    _quillKit(),
                    _buttonGuardar()
                  ],
                ),
              ),
            )),
      ],
    );
  }

  Widget _buttonGuardar() {
    return Container(
        width: double.infinity,
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: ElevatedButton(
            onPressed: _con.user?.id != null
                ? () async {
                    var txt = await hcontroller.getText();
                    if (txt.contains('src=\"data:')) {
                      txt =
                          '<text removed due to base-64 data, displaying the text could cause the app to crash>';
                    }
                    _con.createDiary(txt, _con.user!.id!);
                  }
                : () {},
            child: Text('Guardar')));
  }

  Widget _quillKit() {
    return Padding(
      padding: const EdgeInsets.only(top: 18.0),
      child: Column(
        children: [
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
              child: 
              HtmlEditor(
                htmlEditorOptions: HtmlEditorOptions(adjustHeightForKeyboard: false,
                shouldEnsureVisible: true),
                controller: hcontroller,
                htmlToolbarOptions: HtmlToolbarOptions(
                  defaultToolbarButtons: [
                    
                    
                    FontButtons(),
                    ColorButtons(),
                    ListButtons(),
                    ParagraphButtons(),
                    
                    
                  ],
                ),
                  )
              
      )]
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
}
