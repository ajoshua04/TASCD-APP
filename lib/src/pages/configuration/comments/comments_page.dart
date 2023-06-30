// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

class CommentsPage extends StatefulWidget {
  const CommentsPage({super.key});

  @override
  State<CommentsPage> createState() => _CommentsPageState();
}

class _CommentsPageState extends State<CommentsPage> {
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
                'Este espacio es para ti. Escribe sugerencias o cosas que te gustaría ver dentro de TASCD APP. Cada uno de tus cometarios los vamos a tener muy encuenta para nuestras nuevas versiones. Así que anímate a comentar, escribir y sugerir cualquier cosa que haga de tu experiencia dentro de TASCD APP sea mucho mejor. Muchas gracias, Dios te bendiga.',
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
                decoration:
                    InputDecoration(hintText: 'Escribe aqui tu comentario'),
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
