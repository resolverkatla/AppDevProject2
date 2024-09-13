import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Agencia de Empeños',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // Set initial route to home
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/contacts': (context) => const ContactPage(),
        '/settings': (context) => const SettingsPage(),
      },
    );
  }
}

// Home Page
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("Home"),
        centerTitle: true,
      ),
      body: const Center(child: Text("Home")),
      drawer: const AppDrawer(), // Drawer on home page
    );
  }
}

// Contact Page
class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("Contacts"),
        centerTitle: true,
      ),
      body: const Center(child: Text("Contacts")),
      drawer: const AppDrawer(), // Drawer on contacts page
    );
  }
}

// Settings Page
class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("Settings"),
        centerTitle: true,
      ),
      body: const Center(child: Text("Settings")),
      drawer: const AppDrawer(), // Drawer on settings page
    );
  }
}

// Drawer Widget for Navigation
class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const UserAccountsDrawerHeader(
            accountName: Text("John Wick"),
            accountEmail: Text("johnwick99@gmail.com"),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.red,
              child: Text(
                "W",
                style: TextStyle(fontSize: 40.0),
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/');
            },
          ),
          ListTile(
            leading: const Icon(Icons.contacts),
            title: const Text('Contact Us'),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/contacts');
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Settings'),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/settings');
            },
          )
        ],
      ),
    );
  }
}
