import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shopping Store App',
      theme: ThemeData(
        primarySwatch: Colors.black,
        accentColor: Colors.white,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.black, // AppBar background color
          foregroundColor: Colors.white, // AppBar text color
        ),
        drawerTheme: DrawerThemeData(
          backgroundColor: Colors.black, // Drawer background color
        ),
        scaffoldBackgroundColor: Colors.white, // Background color of Scaffold
        textTheme: TextTheme(
          headline6: TextStyle(color: Colors.black), // AppBar title color
          bodyText1: TextStyle(color: Colors.black), // Body text color
          bodyText2: TextStyle(color: Colors.black), // Body text color
        ),
        cardColor: Colors.white, // Card background color
        dividerColor: Colors.black, // Divider color
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  final List<String> _productImages = [
    'https://via.placeholder.com/150', // Replace with actual image URLs
    'https://via.placeholder.com/150',
    'https://via.placeholder.com/150',
    'https://via.placeholder.com/150',
    'https://via.placeholder.com/150',
    'https://via.placeholder.com/150',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping Store'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.black, // DrawerHeader background color
              ),
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white, // DrawerHeader text color
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              title: Text('Home'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Products'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Cart'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Profile'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: GridView.builder(
        padding: EdgeInsets.all(8.0),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
        ),
        itemCount: _productImages.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 4.0,
            child: GridTile(
              child: Image.network(
                _productImages[index],
                fit: BoxFit.cover,
              ),
              footer: GridTileBar(
                backgroundColor: const Color.fromARGB(176, 0, 0, 0), // Semi-transparent black
                title: Text('Product ${index + 1}', style: TextStyle(color: Colors.white)), // White text
              ),
            ),
          );
        },
      ),
    );
  }
}
