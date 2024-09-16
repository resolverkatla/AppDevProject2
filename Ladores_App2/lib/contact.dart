import 'package:flutter/material.dart';
import 'nav.dart';

class ContactPage extends StatelessWidget {
const ContactPage({super.key});

@override
Widget build(BuildContext context) {
return Scaffold(
  drawer: const NavDrawer(),
  appBar: AppBar(
    title: const Text('Contact'),
  ),
  body: const Center(
    child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.0),
      child: Column(
        children: [
          Text('Phone Number: +639917916934', style: TextStyle(fontSize: 25)),
          Text('Email Address: oliver.ladores@wvsu.edu.ph', style: TextStyle(fontSize: 25)),
          Text('Github: github.com/computerscience-person', style: TextStyle(fontSize: 25)),
        ]
      )
    ),
  ),

);
}
}
