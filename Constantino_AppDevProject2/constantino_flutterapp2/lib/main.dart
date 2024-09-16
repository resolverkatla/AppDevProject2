import 'package:flutter/material.dart';
import 'package:path_animation/widget/path_animation.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key,});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}



class _MyHomePageState extends State<MyHomePage> {

  Path bezierPath1 = Path()
    ..moveTo(-100, 0.0)
    ..quadraticBezierTo(0, 0, 800, 0);
  Path bezierPath2 = Path()
    ..moveTo(-100, 0.0)
    ..quadraticBezierTo(100, 0, 800, 0);    

bool isAnimationVisible = false;
List<int> _randomDurations = List.generate(10, (index) => 3000);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(131, 30, 90, 1),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(131, 30, 90, 1),
        title: Text('Walking duck simulator', 
        style: TextStyle(fontFamily: "ComicSans" , color: Colors.white),),
      ),
      drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              UserAccountsDrawerHeader(
                accountName: Text("John Quack"),
                accountEmail: Text("johnquack69@gmail.com"),
                currentAccountPicture: CircleAvatar(
                  foregroundImage: AssetImage('assets/profile.jpg'),
                ),
                decoration: BoxDecoration(color: Colors.lightGreen),
              ),
              ListTile(
                leading: Icon(Icons.home),
                title: Text('Home'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.contacts),
                title: Text('Contact Us'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.settings),
                title: Text('Settings'),
                onTap: () {
                  Navigator.pop(context);
                },
              )
            ],
          ),
        ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Visibility(
              visible: isAnimationVisible,
              child: Column(
                children: [
                  for (int i = 0; i < 10; i++)
                    PathAnimation(
                      path: i % 2 == 0 ? bezierPath1 : bezierPath2,
                       duration: _randomDurations.isNotEmpty ? Duration(milliseconds: _randomDurations[i]) : Duration(milliseconds: 3000),
                      curve: Curves.linear,
                      repeat: true,
                      reverse: false,
                      drawPath: false,
                      startAnimatedPercent: 0,
                      child: Image(image: AssetImage('assets/1.gif'), height: 75),
                    ),
                ]
              ),
            ) 
          ],
        )
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
             isAnimationVisible = !isAnimationVisible;
             _randomDurations = List.generate(10, (index) => _randomInt(2750, 4500));
                });
               },
            child: Icon(Icons.play_arrow),
          ),
    );
  }
  
  _randomInt(int min, int max) {
    final random = Random();
    return min + random.nextInt(max - min);
  }
}

