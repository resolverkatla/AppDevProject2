import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 138, 32, 32),
          title: const Text(
            "Harry Potter and the Sorcerer's Stone",
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
        ),
        body: Center(
          child: Padding(
            padding: EdgeInsets.zero,
            child: SingleChildScrollView(
              // Scrollable content to fit long texts
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Center(
                    child: Text(
                      'Chapter One',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Image.asset(
                      "assets/images/1.jpg",
                      width: double.infinity, // Make the image take full width
                      height: 200.0, // Set the desired height
                      fit: BoxFit.contain, // Cover the available space
                    ),
                  ),

                  const Center(
                    child: Text(
                      'THE BOY WHO LIVED',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 24.0, // Set a valid font size
                      ),
                    ),
                  ),

                  const SizedBox(height: 20), // Add spacing between the texts

                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: Text(
                      'Mr. and Mrs. Dursley, of number four, Privet Drive, were proud to say that '
                      'they were perfectly normal, thank you very much. They were the last people you would '
                      'expect to be involved in anything strange or mysterious, because they just did not '
                      'hold with such nonsense.\n'
                      'Mr. Dursley was the director of a firm called Grunnings, which made drills. '
                      'He was a big, beefy man with hardly any neck, although he did have a very large mustache. '
                      'Mrs. Dursley was thin and blonde and had nearly twice the usual amount of neck, which came in very useful as she spent so much of '
                      'her time craning over garden fences, spying on the neighbors. '
                      'The Dursleys had a small son called Dudley and in their opinion there was no finer boy anywhere.\n'
                      'The Dursleys had everything they wanted, but they also had a secret, and their greatest fear was that somebody would discover it. ',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.normal,
                        fontSize: 16.0, // Set a valid font size
                      ),
                    ),
                  ),

                  const Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Text(
                      'Page 1 of 100',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 10.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              // Drawer Header with Background Image, Title, and Subtitle
              Container(
                height: 150.0,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                        "assets/images/1.jpg"), // Your background image
                    fit: BoxFit.cover,
                    opacity: 0.5,
                  ),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(20.0), // Padding for text
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Harry Potter and the Sorcerer\'s Stone',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 24.0, // Title font size
                        ),
                      ),
                      SizedBox(
                          height: 10.0), // Spacing between title and subtitle
                      Text(
                        'J.K. Rowling',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.normal,
                          fontSize: 18.0, // Subtitle font size
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // Drawer List Items for navigation
              ListTile(
                leading: const Icon(
                  Icons.favorite,
                  color: Colors.pink,
                ),
                title: const Text('Chapter One'),
                onTap: () {
                  Navigator.pop(
                      context); // Close the drawer when tapping the item
                },
              ),
              ListTile(
                leading: const Icon(
                  Icons.favorite,
                  color: Colors.grey,
                ),
                title: const Text('Chapter Two'),
                onTap: () {
                  Navigator.pop(
                      context); // Close the drawer when tapping the item
                },
              ),
              ListTile(
                leading: const Icon(
                  Icons.favorite,
                  color: Colors.grey,
                ),
                title: const Text('Chapter Three'),
                onTap: () {
                  Navigator.pop(
                      context); // Close the drawer when tapping the item
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
