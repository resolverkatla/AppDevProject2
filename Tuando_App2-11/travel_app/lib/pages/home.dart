import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage  extends StatelessWidget {
  HomePage ({super.key});


@override
Widget build(BuildContext context) {
  // _getCategories();
  return Scaffold(
    appBar: AppBar(
      title: const Text(
        'Travelo',
        style: TextStyle(  // Corrected property name
          color: Color.fromARGB(255, 255, 255, 255),
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),
      ),
      iconTheme: const IconThemeData(
        color: Colors.white,
      ),
      backgroundColor: const Color.fromARGB(255, 11, 60, 100),
      elevation: 0.0,
      centerTitle: true,
    ),
    backgroundColor: Colors.white,
    body: Column (
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container (
        margin: const EdgeInsets.only(top:40, left: 50, right: 50),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Color(0x270127).withOpacity(0.11),
              blurRadius: 60,
              spreadRadius: 0.0
            )
          ]
        ),
      child: TextField(
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          contentPadding: EdgeInsets.all(15),
          hintText: 'Search Location',
          hintStyle: TextStyle(
            color: const Color.fromARGB(255, 172, 172, 172),
            fontSize: 16
          ),
          prefixIcon: Padding ( 
            padding: const EdgeInsets.all(15),
            child: SvgPicture.asset('assets/icons/search.svg')),
          suffixIcon: Padding (
            padding: const EdgeInsets.all(15),
            child: SvgPicture.asset('assets/icons/filter.svg')),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide.none
          )
        ),)
      ),
        SizedBox(height: 50,),  
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text(
                  'Category',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  )
                ),
                ),
           SizedBox(height: 20),
          // Horizontal Row with images and text
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildCategoryBox('images/mountain.jpeg', 'Mountain'),
                _buildCategoryBox('images/beach.jpeg', 'Beach'),
                _buildCategoryBox('images/park.jpg', 'Park'),
              ],
            ),
          ),
      SizedBox(height: 50),
          // Explore Cities Section
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(
              'Explore Cities',
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'All',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text('Popular'),
                Text('Recommended'),
                Text('Most Viewed'),
              ],
            ),
          ),
          SizedBox(height: 20),
          // Horizontal ListView with Explore Cities
          
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.only(left: 15),
              child: Row (
              children: [
                _buildCityCard('images/et.jpg', 'Eiffel Tower', 'Paris'),
                _buildCityCard('images/bk.jpg', 'Burj Khalifa', 'UAE'),
              ],
            ),
          ),
          ])
  ],
    ),
    drawer: Drawer (
      width: 250,
      child: ListView(
        padding: EdgeInsets.zero,
        children: const [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 11, 60, 100),
            ),
            child: Column(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage('images/me.jpg'),
                  radius: 40,
                ),
                SizedBox (
                  width: 300,
                  height: 56,
                child: Center(
                child: Column (
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  Text(
                  'Wysiwyg Watson',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                  ),),
                  SizedBox(height: 0), // Add spacing between the texts
                   Text(
                    'Travelo PRO', // Replace with your additional text
                    style: TextStyle(
                    color: Color.fromARGB(255, 255, 205, 43),
                    fontSize: 12, // Adjust the font size as needed
                ))]))
          )]
      ),),
    
      ListTile(
        leading: Icon(Icons.account_circle),
        title: Text('My Account'),
        ),
      ListTile(
        leading: Icon(Icons.analytics_sharp),
        title: Text('Activities'),
        ),
      ListTile(
        leading: Icon(Icons.settings),
        title: Text('Settings'),
        ),
      ListTile(
        leading: Icon(Icons.privacy_tip_rounded),
        title: Text('Privacy Policy'),
        ),
 ])
  )
 );
}

Container _searchField() {
  return Container (
        margin: const EdgeInsets.only(top:20, left: 50, right: 50),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Color(0x270127).withOpacity(0.11),
              blurRadius: 60,
              spreadRadius: 0.0
            )
          ]
        ),
      child: TextField(
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          contentPadding: EdgeInsets.all(15),
          hintText: 'Search Locationmk',
          hintStyle: TextStyle(
            color: const Color.fromARGB(255, 172, 172, 172),
            fontSize: 16
          ),
          prefixIcon: Padding ( 
            padding: const EdgeInsets.all(15),
            child: SvgPicture.asset('assets/icons/search.svg')),
          suffixIcon: Padding (
            padding: const EdgeInsets.all(15),
            child: SvgPicture.asset('assets/icons/filter.svg')),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide.none
          )
        ),)
      );
}

 Widget _buildCategoryBox(String imagePath, String categoryName) {
    return Container(
      width: 100, // Adjust the width of each box
      height: 120,
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 11, 60, 100),
        borderRadius: BorderRadius.circular(15), // Rounded edges
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Image section
          ClipRRect(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15), topRight: Radius.circular(15)),
            child: Image.asset(
              imagePath,
              height: 80,
              width: 100,
              fit: BoxFit.cover, // Ensure the image fits properly
            ),
          ),
          // Text section
          Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Text(
              categoryName,
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCityCard(String imagePath, String cityName, String location) {
    return Container(
      width: 180, // Width of each city card
      margin: EdgeInsets.only(right: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3), // Shadow position
          ),
        ],
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              imagePath,
              height: 260,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  cityName,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4),
                Row(
                  children: [
                    Icon(
                      Icons.location_on,
                      color: Colors.grey,
                      size: 16,
                    ),
                    SizedBox(width: 4),
                    Text(
                      location,
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }


}