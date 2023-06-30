// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

class LettersAndFontsPage extends StatefulWidget {
  const LettersAndFontsPage({super.key});

  @override
  State<LettersAndFontsPage> createState() => _LettersAndFontsPageState();
}

class _LettersAndFontsPageState extends State<LettersAndFontsPage> {
  List<String>? list;
  double? _currentSliderValue;
  String? dropdownValue;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _currentSliderValue = 14;
    list = <String>[
      'Segoe UI',
      'Courier New',
      'Franklin Gothic Medium',
      'Lucida Sans',
      'Gill Sans',
      'Arial'
    ];
    dropdownValue = list!.first;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'A   a',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 15),
            child: Text(
              'Oye, hijo mío, la instrucción de tu padre, Y no desprecies la dirección de tu madre',
              style: TextStyle(height: 1.5, fontSize: _currentSliderValue),
              textAlign: TextAlign.center,
            ),
          ),
          Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.only(top: 12.0, left: 15),
                child: Text(
                  'Tamaño de la letra',
                  style: TextStyle(color: Colors.grey[600]),
                ),
              )),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Slider(
              value: _currentSliderValue!,
              max: 30,
              min: 14,
              divisions: 9,
              label: _currentSliderValue!.round().toString(),
              onChanged: (double value) {
                setState(() {
                  _currentSliderValue = value;
                });
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Divider(
              thickness: 1,
              height: 10,
              color: Colors.grey[400],
            ),
          ),
          Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.only(top: 12.0, left: 15),
                child: Text(
                  'Tipo de letra',
                  style: TextStyle(color: Colors.grey[600]),
                ),
              )),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: DropdownButton<String>(
              value: dropdownValue,
              icon: const Icon(Icons.arrow_downward),
              elevation: 16,
              style: const TextStyle(color: Colors.deepPurple),
              underline: Container(
                height: 2,
                color: Colors.deepPurpleAccent,
              ),
              onChanged: (String? value) {
                // This is called when the user selects an item.
                setState(() {
                  dropdownValue = value!;
                });
              },
              items: list?.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Divider(
              thickness: 1,
              height: 10,
              color: Colors.grey[400],
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: 50, vertical: 30),
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  padding: EdgeInsets.symmetric(vertical: 15)),
              child: Text("Guardar"),
            ),
          )
        ],
      ),
    );
  }
}
