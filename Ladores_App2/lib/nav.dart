import 'package:flutter/material.dart';

class NavDrawer extends StatelessWidget {
  const NavDrawer({super.key});

@override
Widget build(BuildContext context) {
return Drawer(
  child: ListView(
    padding: EdgeInsets.zero,
    children: [
      UserAccountsDrawerHeader(
        accountName: const Text("Oliver Ladores"),
        accountEmail: const Text("oliver.ladores@wvsu.edu.ph"),
        currentAccountPicture: CircleAvatar(
          backgroundColor: Colors.red[400],
          child: const Text(
            "W",
            style: TextStyle(fontSize: 40.0),
          ),
        ),
      ),
      ListTile(
        leading: const Icon(Icons.home),
        title: const Text('Home'),
        onTap: () {
          Navigator.of(context).pushReplacementNamed('/');
        },
      ),
      ListTile(
        leading: const Icon(Icons.contacts),
        title: const Text('Contact Us'),
        onTap: () {
          Navigator.of(context).pushReplacementNamed('/contacts');
        },
     ),
      ListTile(
        leading: const Icon(Icons.settings),
        title: const Text('About'),
        onTap: () {
          Navigator.of(context).pushReplacementNamed('/about');
        },
      )
    ],
  )); }
}
