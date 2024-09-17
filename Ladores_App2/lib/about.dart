import 'package:flutter/material.dart';
import 'nav.dart';

class AboutPage extends StatelessWidget {
const AboutPage({super.key});

@override
Widget build(BuildContext context) {
return Scaffold(
    drawer: const NavDrawer(),
    appBar: AppBar(
      title: const Text('About'),
    ),
    body: const Center(
      child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.0),
          child: Text(
            "Hi, I'm Ollie 👋. I'm a student at WVSU. I'm currently learning about computer science and software development, and hope to work on libraries/tools for others. ",
            style: TextStyle(fontSize: 30),
          ),
        ),
      ),
    );
}
}
