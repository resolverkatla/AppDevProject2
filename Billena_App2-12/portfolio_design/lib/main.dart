
import 'package:flutter/material.dart';

void main() {
  runApp(const PortfolioApp());
}

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dhomii Portfolio',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      debugShowCheckedModeBanner: false,
      home: const PortfolioHome(),
    );
  }
}

class PortfolioHome extends StatelessWidget {
  const PortfolioHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('Dhomii Portfolio'),
          ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage('assets/dhomii.jpg'), // Add a profile image here
                ),
              ),
              const SizedBox(height: 20),
              const Center(
                child: Text(
                  'Dhominick John',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 5),
              Center(
                child: Text(
                  'Lost in Flutter | Server Builds Enthusiast',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[600],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Divider(),
              const SizedBox(height: 10),
              
              const Row(
                children: [
                  Icon(Icons.person),
                  SizedBox(width: 5),
                  Text(
                    'About Me',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              const Text(
                'I am still learning this framework, it seems to be confusing. Hopefully, I get how this works soon!',
                style: TextStyle(fontSize: 15),
              ),
              const SizedBox(height: 20),
              const Divider(),
              
              // Projects Section
              const Row(
                children: [
                  Icon(Icons.business),
                  Text(
                    ' Projects',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              const ProjectCard(
                title: 'Project Shirohana',
                description: 'A simple visual novel catalog system.',
              ),
              const ProjectCard(
                title: 'Aquaterra',
                description: 'A plant status detection system featuring system built design.',
              ),
              const SizedBox(height: 20),
              const Divider(),
              
              // Contact Section
              const Row(
                children: [
                  Icon(Icons.call),
                  Text(
                    ' Contact Me',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              const ListTile(
                leading: Icon(Icons.email),
                title: Text('don\'t contact me.'),
              ),
              const ListTile(
                leading: Icon(Icons.phone),
                title: Text('+${1000000}'),
              ),
              const ListTile(
                leading: Icon(Icons.web),
                title: Text('dhominickj.github.io'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Reusable Widget for Project Card
class ProjectCard extends StatelessWidget {
  final String title;
  final String description;

  const ProjectCard({super.key, required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              description,
              style: const TextStyle(fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}
