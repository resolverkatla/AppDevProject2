import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Genshin Impact Characters',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  final List<Character> characters = [
    Character(
        name: 'Albedo',
        image: 'assets/albedocard.png',
        description: 'A synthetic human made by the alchemist Rhinedottir'),
    Character(
        name: 'Kaedahara Kazuha',
        image: 'assets/kazuhacard.png',
        description: 'A wandering samurai of the once-famed Kaedehara Clan.'),
    Character(
        name: 'Alhaitham',
        image: 'assets/alhaithamcard.png',
        description:
            'a scholar who is fueled by a desire to understand the underlying principles of the world around him.'),
    Character(
        name: 'Kamisato Ayaka',
        image: 'assets/ayakacard.png',
        description: 'Cryo user, a graceful swordfighter.'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Babies'),
        leading: Image.asset(
          'assets/mainlogo1.png',
          fit: BoxFit.contain,
          height: 40.0,
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // Search action
            },
          ),
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {
              _showMoreOptions(context);
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16.0,
            mainAxisSpacing: 16.0,
          ),
          itemCount: characters.length,
          itemBuilder: (context, index) {
            return _buildCard(context, characters[index]);
          },
        ),
      ),
    );
  }

  Widget _buildCard(BuildContext context, Character character) {
    return Card(
      elevation: 5,
      child: InkWell(
        onTap: () {
          _showCharacterDetails(context, character);
        },
        child: Column(
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0), // Rounded corners
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Image.asset(
                    character.image,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(character.name,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            ),
          ],
        ),
      ),
    );
  }

  void _showCharacterDetails(BuildContext context, Character character) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(character.name),
          content: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.asset(character.image, fit: BoxFit.fill),
              ),
              SizedBox(height: 16),
              Text(character.description),
            ],
          ),
          actions: [
            TextButton(
              child: Text('Close'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _showMoreOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                leading: Icon(Icons.home),
                title: Text('Home'),
                onTap: () {
                  // Handle home tap
                  Navigator.pop(context); // Close the bottom sheet
                },
              ),
              ListTile(
                leading: Icon(Icons.star),
                title: Text('Favorites'),
                onTap: () {
                  // Handle favorites tap
                  Navigator.pop(context); // Close the bottom sheet
                },
              ),
              ListTile(
                leading: Icon(Icons.settings),
                title: Text('Settings'),
                onTap: () {
                  // Handle settings tap
                  Navigator.pop(context); // Close the bottom sheet
                },
              ),
            ],
          ),
        );
      },
    );
  }
}

class Character {
  final String name;
  final String image;
  final String description;

  Character(
      {required this.name, required this.image, required this.description});
}
