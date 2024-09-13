import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chastagram',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Chastagram',
          style: TextStyle(
            color: Colors.black,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView(
        children: <Widget>[
          _buildPost(
              'https://scontent.fceb1-2.fna.fbcdn.net/v/t39.30808-6/459221672_122113548908395122_8795635371698235038_n.jpg?_nc_cat=111&ccb=1-7&_nc_sid=127cfc&_nc_eui2=AeFrMAExtGtHBSQTkEBVCPefErYtGjH1GPsSti0aMfUY-7fN6AIhtRL1-H2Ptxl9DvdxsByyJg1qY1Jxw_DGjZ5n&_nc_ohc=Rzq7TP0n9s0Q7kNvgFsrYOm&_nc_zt=23&_nc_ht=scontent.fceb1-2.fna&_nc_gid=ApGJrbsr4Sx8RTuNGB0tEwN&oh=00_AYApoxpIMGyWlLWPPELWCeYx2YbaOYHSfk7V8anim7tZBw&oe=66EA1081',
              'cha.dianne'),
          _buildPost(
              'https://scontent.fceb1-2.fna.fbcdn.net/v/t39.30808-6/450660800_994240102399882_3701399544023074701_n.jpg?stp=dst-jpegr&_nc_cat=108&ccb=1-7&_nc_sid=127cfc&_nc_eui2=AeF1pomCk81dt9X9NoBh9KNreWV2xPgAM0N5ZXbE-AAzQ02e9HBW9s7o89UvcuElvt21K0SG6qsbxEyqrf1sAoRz&_nc_ohc=EUA3rUbARM8Q7kNvgFElKKo&_nc_zt=23&se=-1&_nc_ht=scontent.fceb1-2.fna&_nc_gid=ARyjJumuIgdUy5EenbfQBRT&oh=00_AYDZnU2sqgEzgMRPZ18p3d4PZRJ0504da9XuwnwDcpP_UA&oe=66EA29E6',
              'cha.official'),
        ],
      ),
    );
  }

  Widget _buildPost(String imageUrl, String username) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        ListTile(
          leading: const CircleAvatar(
            backgroundImage: NetworkImage('https://placekitten.com/50/50'),
          ),
          title: Text(username,
              style: const TextStyle(fontWeight: FontWeight.bold)),
        ),
        Image.network(imageUrl),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'Liked by dyosabaaan and others',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0),
          child: Text('View all 12.3k comments',
              style: TextStyle(color: Colors.grey)),
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
