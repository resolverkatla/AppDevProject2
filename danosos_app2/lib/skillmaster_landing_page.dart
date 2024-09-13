// Lemmuel Dave Dañosos BSCS 3A-AI
// Partial Code for the SkillMaster landing page
// SkillMaster is a sports training app that helps users improve their skills in various sports.
// The SkillMaster landing page displays a list of sports that users can choose from to start training.
// The landing page also includes a drawer menu with options to navigate to other pages in the app.
// This application is still in development, and the landing page and other pages are work in progress.

import 'dart:async';
import 'package:flutter/material.dart';

void main() {
  runApp(const SkillMasterSportsApp()); // Start the application
}

class SkillMasterSportsApp extends StatelessWidget {
  const SkillMasterSportsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SkillMaster',
      theme: ThemeData(
        primarySwatch: Colors.blue, // Set the primary color theme
      ),
      home: const LandingPage(name: ''), // Initialize the LandingPage with an empty name
    );
  }
}

class AppStyles {
  // Define common padding and spacing
  static const EdgeInsets padding = EdgeInsets.all(16);
  static const double buttonVerticalPadding = 12;
  static const double buttonSpacing = 16;

  // Define button style
  static final ButtonStyle sportButtonStyle = ElevatedButton.styleFrom(
    foregroundColor: Colors.white, backgroundColor: const Color.fromARGB(255, 0, 93, 136), // Button text color
    padding: const EdgeInsets.symmetric(vertical: buttonVerticalPadding),
    textStyle: const TextStyle(fontSize: 18),
    elevation: 5,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8), // Rounded corners
    ),
  );

  // Define text styles
  static const TextStyle heading = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
  );
  static const TextStyle subheading = TextStyle(
    fontSize: 18,
    color: Colors.grey,
  );
}

// Landing Page for the SkillMaster app
class LandingPage extends StatelessWidget {
  final String _name;

// Initialize the LandingPage with a name
// The name is used to personalize the greeting message

  const LandingPage({super.key, required String name})
      : _name = name;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SkillMaster'), // AppBar title
      ),
     drawer: Drawer(
      width: 270, // Width of the Drawer
        child: Column(
           children: <Widget>[
              Expanded(
              child: ListView(
              padding: EdgeInsets.zero,
                children: <Widget>[
                DrawerHeader(
                decoration: const BoxDecoration(
                color: Color.fromARGB(255, 0, 93, 136), // DrawerHeader background color
              ),
          child: SingleChildScrollView(
             child: Column(
           crossAxisAlignment: CrossAxisAlignment.start, // Align items to the start
              children: [
           Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const CircleAvatar(
              radius: 50, // Avatar size
              backgroundColor: Color.fromARGB(255, 191, 156, 28), // Avatar background color
              child: Text(
                "L", // Initials of the user
                style: TextStyle(fontSize: 40.0),
              ),
            ),
            IconButton(
              icon: const Icon(
                Icons.arrow_back,  // Back arrow icon
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.of(context).pop();  // Close the drawer
              },
            ),
          ],
        ),
        const SizedBox(height: 10), // Spacing between the avatar and text
        const Text(
          'Lemmuel Dave', 
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    ),
  ),
),

                  // List of drawer items
                   
                  ListTile(
                    leading: const Icon(Icons.home),
                    title: const Text('Home'),
                    onTap: () {
                      Navigator.pop(context); // Close the drawer
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.person),
                    title: const Text('Account'),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const AccountPage(),
                        ),
                      ); // Navigate to SettingsPage
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.sports),
                    title: const Text('Sports'),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SportsPage(),
                        ),
                      );  // Navigate to SportsPage
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.settings),
                    title: const Text('Settings'),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SettingsPage(),
                        ),
                      ); // Navigate to SettingsPage
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.help),
                    title: const Text('Help'),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HelpPage(),
                        ),
                      ); // Navigate to SettingsPage
                    },
                  ),
                ],
              ),
            ),
            // Footer section in the drawer
            Container(
              padding: const EdgeInsets.all(16),
              color: const Color.fromARGB(255, 0, 93, 136),  // Footer background color
              child: const Center(
                child: Text(
                  '@2024 SkillMaster',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: Builder(
        builder: (BuildContext context) {
          return Padding(
            padding: AppStyles.padding,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 20),
                Text(
                  'Welcome to SkillMaster $_name',
                  style: AppStyles.heading,   // Custom heading style
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                const Text(
                  'Choose your sport and start improving your skills!',
                  style: AppStyles.subheading,   // Custom subheading style
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 40),
                _buildSportButton(context, 'Volleyball', const Color.fromARGB(255, 246, 249, 250), ['assets/images/vb.png', 'assets/images/volleyball2.png', 'assets/images/exercise.png']),  // Volleyball button
                const SizedBox(height: AppStyles.buttonSpacing),
                _buildSportButton(context, 'Basketball', const Color.fromARGB(255, 246, 249, 250), ['assets/images/basketball.png', 'assets/images/basketball2.png', 'assets/images/exercise.png']), // Basketball button
                const SizedBox(height: AppStyles.buttonSpacing),
                _buildSportButton(context, 'Football', const Color.fromARGB(255, 246, 249, 250), ['assets/images/soccer.png', 'assets/images/football2.png', 'assets/images/exercise.png']), // Football button
              ],
            ),
          );
        },
      ),
    );
  }

 // Builds a button for each sport with a rotating image
  Widget _buildSportButton(BuildContext context, String sport, Color color, List<String> imagePaths) {
    return HoverSportButton(
      buttonStyle: const ButtonStyle(animationDuration: Duration()), // Add the required 'buttonStyle' argument
      sport: sport,
      color: color,
      imagePaths: imagePaths,
      name: _name,
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(color),
        padding: WidgetStateProperty.all(const EdgeInsets.symmetric(vertical: AppStyles.buttonVerticalPadding)),
        textStyle: WidgetStateProperty.all(const TextStyle(fontSize: 18)),
      ),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SelectTrainingTypePage(sport: sport, name: _name),
          ),
        ); // Navigate to SelectTrainingTypePage
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            imagePaths[0], // Display the current image in rotation
            height: 30, // Adjust the size as needed
          ),
          const SizedBox(width: 10),
          Text(sport),  // Display the sport name
        ],
      ),
    );
  }
}


class HoverSportButton extends StatefulWidget {
  final String sport;
  final Color color;
  final List<String> imagePaths;
  final String name;
  final ButtonStyle style;
  final VoidCallback onPressed;
  final Row child;

  const HoverSportButton({
    super.key,
    required this.sport,
    required this.color,
    required this.imagePaths,
    required this.name,
    required this.onPressed,
    required this.style,
    required this.child, required ButtonStyle buttonStyle,
  });

  @override
  
  _HoverSportButtonState createState() => _HoverSportButtonState();
}

class _HoverSportButtonState extends State<HoverSportButton> { // 
  int _currentIndex = 0;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    if (widget.imagePaths.isNotEmpty) { 
       // Start a periodic timer to change images every 2 seconds
      _timer = Timer.periodic(const Duration(seconds: 2), (timer) {
        setState(() {
          _currentIndex = (_currentIndex + 1) % widget.imagePaths.length;
        });
      });
    }
  }

  @override
  void dispose() {
    _timer.cancel(); // Cancel the timer when the widget is disposed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: widget.style, // Use the style defined in the widget
      onPressed: widget.onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (widget.imagePaths.isNotEmpty)
            SizedBox(
              width: 50,  // Fixed width for the image area
              height: 40, // Fixed height for the image area
              child: AnimatedSwitcher(
                duration: const Duration(seconds: 1), // Image transition duration
                child: Image.asset(
                  widget.imagePaths[_currentIndex],
                  key: ValueKey<String>(widget.imagePaths[_currentIndex]),
                  height: 30,
                  width: 30, // Ensure the image fits in the box
                ),
              ),
            )
          else
            const SizedBox(), // Empty box if no images are provided
          const SizedBox(width: 45), // Space between the image and text
          Text(widget.sport), // Static text that won't change
        ],
      ),
    );
  }
}

class SelectTrainingTypePage extends StatelessWidget {
  final String _sport;
  final String _name;

  const SelectTrainingTypePage({super.key, required String sport, required String name})
      : _sport = sport,
        _name = name;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$_sport Training'),  // AppBar title with sport name
      ),
      body: Padding(
        padding: AppStyles.padding, // Use the custom padding
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch, // Stretch the column
          children: [
            const SizedBox(height: 20), // Add some space
            Text(
              'Choose Training Type for $_sport', // Display the sport name
              style: AppStyles.heading,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40), // Add some space
            _buildTrainingTypeButton(context, 'Workouts'), // Add a button for each training type
            const SizedBox(height: AppStyles.buttonSpacing), // Add some space between buttons
            _buildTrainingTypeButton(context, 'Tactics & Strategies'), // Add a button for each training type
          ],
        ),  
      ),
    );
  }

  Widget _buildTrainingTypeButton(BuildContext context, String trainingType) { // Build a button for each training type
    return ElevatedButton(
      style: ButtonStyle(
        padding: WidgetStateProperty.all(const EdgeInsets.symmetric(vertical: AppStyles.buttonVerticalPadding)), // Use the custom padding
        textStyle: WidgetStateProperty.all(const TextStyle(fontSize: 18)), 
      ),
      onPressed: () { // Navigate to the TrainingDetailPage
        Navigator.push(  
          context,
          MaterialPageRoute( 
            builder: (context) => TrainingDetailPage(sport: _sport, name: _name, trainingType: trainingType), // Pass the sport, name, and training type
          ),
        );
      },
      child: Text(trainingType),
    );
  }
}
 
 // Display the training details for the selected sport
class TrainingDetailPage extends StatelessWidget {
  final String _sport;
  final String _name;
  final String _trainingType;

  const TrainingDetailPage({super.key, required String sport, required String name, required String trainingType})
      : _sport = sport,
        _name = name,
        _trainingType = trainingType;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$_sport $_trainingType'),
      ),
      body: Center(
        child: Text(
          'Welcome to $_sport $_trainingType section, $_name!',
          style: AppStyles.heading,
        ),
      ),
    );
  }
}
 
 class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Account'),
      ),
      body: const Center(
        child:  Text('This is the Account Page'),
      ),
    );
  }
}
 // Custom styles for the app
class SportsPage extends StatelessWidget {
  const SportsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sports'),
      ),
      body: const Center(
        child:  Text('This is the Sports Page'),
      ),
    );
  }
}
 
 // Custom styles for the app
class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body:const Center(
        child:  Text('This is the Settings Page'),
      ),
    );
  }
}
 
 // Custom styles for the app
class HelpPage extends StatelessWidget {
  const HelpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Help'),
      ),
      body: const Center(
        child:  Text('This is the Help Page'),
      ),
    );
  }
}

