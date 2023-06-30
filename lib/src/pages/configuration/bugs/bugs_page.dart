// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class BugsPage extends StatefulWidget {
  const BugsPage({super.key});

  @override
  State<BugsPage> createState() => _BugsPageState();
}

class _BugsPageState extends State<BugsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //key: _con.key,
        appBar: AppBar(),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                'Gracias por ayudarnos a mejorar, a continuación deja lo sucedido',
                style: TextStyle(height: 1.5),
                textAlign: TextAlign.justify,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Divider(
                thickness: 1,
                height: 10,
                color: Colors.grey[300],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: TextField(
                decoration: InputDecoration(
                    hintText: 'Escribe aqui que bug encontraste'),
                keyboardType: TextInputType.multiline,
                minLines: 1,
                maxLines: 5,
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
                child: Text("Enviar"),
              ),
            )
          ],
        ));
  }
}
