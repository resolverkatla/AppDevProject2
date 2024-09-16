import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Sidebar Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void myfunc(){
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey, // Attach the scaffold key here to control the drawer
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: const Text(
          'User Profile',
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          color: Colors.white,
          icon: const Icon(Icons.menu), // Icon for toggling the sidebar
          onPressed: () {
            _scaffoldKey.currentState?.openDrawer();
          },
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Colors.blue,
              ),


              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundColor: const Color.fromARGB(255, 226, 226, 226),
                    child: ClipOval(
                      child: Image.asset("images/Bergancia-1x1-Pic.png", 
                        height: 100,
                        width: 100,
                      ),
                  )
                  ),

                  const Text(
                    'Mauricio Manuel F. \nBergancia',
                     style: TextStyle(
                      fontFamily: 'Poppins',
                      color: Colors.white,
                      fontSize: 14,
                ),
              ),],
              )
            ),


            ListTile(
              leading: const Icon(Icons.info),
              title: const Text('About Me'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AboutMePage()),
                );
              },
              
            ),
            ListTile(
              leading: const Icon(Icons.local_activity),
              title: const Text('Hobbies'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HobbiesPage()),
                );
              },
            ),


            ListTile(
              leading: const Icon(Icons.contact_page),
              title: const Text('Contact Information'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ContactInfoPage()),
                );
              },
            ),
          ],
        ),
      ),
      body: const Center(
        child: Text('Get To Know Me!!!', style: TextStyle(fontFamily: 'Poppins', fontSize: 36, fontWeight: FontWeight.bold),),
      ),
    );
  }
}

class AboutMePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: const Text(
          'About Me',
          style: TextStyle(color: Colors.white),
        )
        ),
      body: const Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          
          //ROW 1
          Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 50,
            ),
            Card(
              color: Color.fromARGB(255, 240, 165, 4),
              // elevation: 20,
              child: SizedBox(
                height: 100,
                width: 130,
                child: Center(
                  child: Text("HELPFUL", style: TextStyle(fontFamily: 'Poppins', 
                                fontWeight: FontWeight.bold, 
                                fontSize: 16,
                                color: Color.fromARGB(255, 243, 243, 243)),),
                )
              ),
            ),

            Card(
              color: Color.fromARGB(255, 56, 2, 100),
              // elevation: 20,
              child: SizedBox(
                height: 100,
                width: 130,
                child: Center(
                  child: Text("CUTE", style: TextStyle(fontFamily: 'Poppins', 
                          fontWeight: FontWeight.bold, 
                          fontSize: 16,
                          color: Colors.white),
                          ),
                )
              ),
            ),

            Card(
              color: Color.fromARGB(255, 10, 126, 6),
              // elevation: 20,
              child: SizedBox(
                height: 100,
                width: 130,
                child: Center(
                  child: Text("MAARTE", style: TextStyle(fontFamily: 'Poppins', 
                          fontWeight: FontWeight.bold, 
                          fontSize: 16,
                          color: Colors.white),
                          ),
                )
              ),
            )
          ],
        ),

        //ROW 2
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 0,
            ),
            Card(
              color: Colors.blue,
              // elevation: 20,
              child: SizedBox(
                height: 100,
                width: 130,
                child: Center(
                  child: Text("KIND", style: TextStyle(fontFamily: 'Poppins', 
                                fontWeight: FontWeight.bold, 
                                fontSize: 16,
                                color: Color.fromARGB(255, 243, 243, 243)),),
                )
              ),
            ),

            Card(
              color: Color.fromARGB(255, 192, 13, 13),
              // elevation: 20,
              child: SizedBox(
                height: 100,
                width: 130,
                child: Center(
                  child: Text("ARTICULATE", style: TextStyle(fontFamily: 'Poppins', 
                          fontWeight: FontWeight.bold, 
                          fontSize: 16,
                          color: Colors.white),
                          ),
                )
              ),
            ),

            Card(
              color: Color.fromARGB(255, 2, 90, 75),
              // elevation: 20,
              child: SizedBox(
                height: 100,
                width: 130,
                child: Center(
                  child: Text("SLAYER", style: TextStyle(fontFamily: 'Poppins', 
                          fontWeight: FontWeight.bold, 
                          fontSize: 16,
                          color: Colors.white),
                          ),
                )
              ),
            )
          ],
        ),
        
        //ROW3
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 50,
            ),
            Card(
              color: Color.fromARGB(255, 219, 114, 16),
              // elevation: 20,
              child: SizedBox(
                height: 100,
                width: 130,
                child: Center(
                  child: Text("CHEERFUL", style: TextStyle(fontFamily: 'Poppins', 
                                fontWeight: FontWeight.bold, 
                                fontSize: 16,
                                color: Color.fromARGB(255, 243, 243, 243)),),
                )
              ),
            ),

            Card(
              color: Color.fromARGB(255, 233, 23, 233),
              // elevation: 20,
              child: SizedBox(
                height: 100,
                width: 130,
                child: Center(
                  child: Text("OBEDIENT", style: TextStyle(fontFamily: 'Poppins', 
                          fontWeight: FontWeight.bold, 
                          fontSize: 16,
                          color: Colors.white),
                          ),
                )
              ),
            ),

            Card(
              color: Color.fromARGB(255, 241, 97, 0),
              // elevation: 20,
              child: SizedBox(
                height: 100,
                width: 130,
                child: Center(
                  child: Text("TECHY", style: TextStyle(fontFamily: 'Poppins', 
                          fontWeight: FontWeight.bold, 
                          fontSize: 16,
                          color: Colors.white),
                          ),
                )
              ),
            )
          ],
        ),
        ]
      ),
    );
  }
}

class HobbiesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    //map of hobbies
   final List<Map<String, String>> hobbiesList = [
    {"hobby" : "Coding", "img" : "images/coding-image.jpg"},
    {"hobby" : "Reading", "img" : "images/reading.jpeg"},
    {"hobby" : "Learning", "img" : "images/learning.jpg"}
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: const Text(
          'Hobbies',
          style: TextStyle(color: Colors.white),
        )
        ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Card(
              color: Colors.black87,
              child: SizedBox(
                height: 150,
                width: 150,
                child: Column(
                  children: [
                    Image.asset(hobbiesList[0]["img"]!, height: 100, width: 100),
                    Text(hobbiesList[0]["hobby"]!, style: const TextStyle(color: Color.fromARGB(255, 240, 240, 240), fontSize: 16, fontFamily: 'Poppins'),),
                  ],
                ),
              ),
            ),

            Card(
              color: Colors.black87,
              child: SizedBox(
                height: 150,
                width: 150,
                child: Column(
                  children: [
                     Image.asset(hobbiesList[1]["img"]!, height: 100, width: 100, ),
                    Text(hobbiesList[1]["hobby"]!, style: TextStyle(color: const Color.fromARGB(255, 240, 240, 240), 
                                  fontSize: 16, fontFamily: 'Poppins'),)
                  ],
                ),
              ),
            ),

            Card(
              color: Colors.black87,
              child: SizedBox(
                height: 150,
                width: 150,
                child: Column(
                  children: [
                     Image.asset(hobbiesList[2]["img"]!, height: 100, width: 100, ),
                    Text(hobbiesList[2]["hobby"]!, style: TextStyle(color: const Color.fromARGB(255, 240, 240, 240), 
                                  fontSize: 16, fontFamily: 'Poppins'),)
                  ],
                ),
              ),
            )
          ],
        ) 
        ),
      );          
}
}

class ContactInfoPage extends StatelessWidget {

  //contact info list
  final List<Map<String, String>> contactInfo = [
    {"contact_type" : "Phone Number", "data" : "0927 179 4922"},
    {"contact_type" : "Facebook", "data" : "Mauricio Manuel F. Bergancia"},
    {"contact_type" : "LinkedIn", "data" : "Mauricio Manuel F. Bergancia"},
    ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: const Text(
          'Contact Information',
          style: TextStyle(color: Colors.white),
        )
        ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Card(
              color: Colors.black87,
              child: SizedBox(
                height: 150,
                width: 130,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(Icons.phone, color: Colors.blue, size: 50,),
                    Text(contactInfo[0]["data"]!, style: const TextStyle(color: Color.fromARGB(255, 240, 240, 240), fontSize: 8, fontFamily: 'Poppins'),),
                  ],
                ),
              ),
            ),

            Card(
              color: Colors.black87,
              child: SizedBox(
                height: 150,
                width: 130,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(Icons.facebook_rounded, color: Colors.blue, size: 50,),
                    Text(contactInfo[1]["data"]!, style: TextStyle(color: const Color.fromARGB(255, 240, 240, 240), fontSize: 8, fontFamily: 'Poppins'))
                  ],
                ),
              ),
            ),

            Card(
              color: Colors.black87,
              
              child: SizedBox(
                height: 150,
                width: 130,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset("images/linkedin.png", height: 50, width: 50,),
                    Text(contactInfo[2]["data"]!, style: TextStyle(color: const Color.fromARGB(255, 240, 240, 240), fontSize: 8, fontFamily: 'Poppins'),)
                  ],
                ),
              ),
            )
          ],
        ) 
        ),
    );
  }
}
