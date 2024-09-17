// import 'dart:html';
import 'package:flutter/material.dart';
import './nav.dart';
import './about.dart';
import './contact.dart';

void main() {
  runApp(const MaterialApp(
    title: "MyApp",
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hello',
      routes: {
        // '/': (BuildContext ctx) => const MyApp(),
        '/about': (BuildContext ctx) => const AboutPage(),
        '/contacts': (BuildContext ctx) => const ContactPage(),
      },
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          // leading: Icon(Icons.),
          // title: const Text("Oli"),
          centerTitle: true,
        ),
        body: Center(
          child: Padding(
              padding: const EdgeInsets.all(0),
              child: Container(
                child: const Padding(
                  padding: EdgeInsets.only(top: 20, left: 30, right: 30, bottom: 20),
                  child: Text(
                    "Hello",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 45.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              )),
        ),
        drawer: const NavDrawer(),
      ),
    );
  }
}

