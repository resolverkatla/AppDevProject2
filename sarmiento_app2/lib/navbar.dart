import 'package:flutter/material.dart';
import 'package:profile_page/gallery.dart';
import 'package:profile_page/main.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      // backgroundColor: const Color.fromARGB(221, 28, 34, 55),
      child: ListView(
        children: <Widget>[
          Container(
            height: 200,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/jeno_bg.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            child: UserAccountsDrawerHeader(
              margin: const EdgeInsets.all(10.0),
              decoration: const BoxDecoration(
                color: Colors.transparent,
              ),
              accountName: const Text(
                'LeeJeno',
                style: TextStyle(color: Colors.white),
              ),
              accountEmail: const Text(
                'leejeno.0423@naver.com',
                style: TextStyle(color: Colors.white),
              ),
              currentAccountPicture: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.white,
                    width: 2,
                  ),
                ),
                child: const CircleAvatar(
                  backgroundImage: AssetImage('assets/jeno_pf.jpg'),
                  radius: 100,
                ),
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text(
              'Home',
              style: TextStyle(fontSize: 20),
            ),
            // textColor: Colors.white,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ProfilePage()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.image),
            title: const Text('Gallery', style: TextStyle(fontSize: 20)),
            // textColor: Colors.white,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const GalleryPage()),
              );
            },
          ),
        ],
      ),
    );
  }
}
