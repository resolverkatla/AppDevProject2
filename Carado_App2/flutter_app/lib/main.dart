import 'package:flutter/material.dart';
import 'redirect_link.dart';

void main()
{
  runApp(const AppDevApp());
}

class AppDevApp extends StatefulWidget {
  const AppDevApp({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _AppDevAppState createState() => _AppDevAppState();
}

class _AppDevAppState extends State<AppDevApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SingleChildScrollView(
          child: Container(
              margin: const EdgeInsets.all(15),
              padding: const EdgeInsets.all(30),
              // color: Color.fromARGB(106, 182, 182, 182), // Uncomment to see guide
              child: Column(
                children: [

                  // Create widgets in a a horizontal orientation
                  // Row Widget for my pic and name
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start, // Align to left
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [

                      // Profile Picture
                      ClipOval(
                        child: SizedBox(
                          width: 130,
                          height: 130,
                          child: Image.asset(
                            'assets/images/pfp.jpg',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),

                      const SizedBox(width: 20), // Space between image and name

                      // Text next to image
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start, // Aligns children to left
                        children: [
                        
                        // Username
                        Text(
                        'Manns',
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 11, 158, 255)
                              )
                            ),

                          // Subtext 
                          Text('Data Scientist',
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 78, 78, 78)
                            )
                          ),

                          // Subtext 
                          Text('INTJ-A | He/Him',
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 78, 78, 78)
                            )
                          ),
                          ],
                        )
                    ], // Children of Row
                  ),
                
                  const SizedBox(height: 15), // space between

                // About me container
                  const SizedBox(
                    height: 200,
                    width: double.infinity,
                    //color: Color.fromARGB(26, 59, 59, 59), // Color Guide
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,  // Aligns to left
                      children: [
                        Text(
                          'About Me',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Color.fromARGB(255, 11, 158, 255)
                          ),
                        ),

                        SizedBox(width: 35), // Space 

                        // About me Content
                        Text(
                          'Manns is a driven computer science student majoring in AI, with a strong focus on deep learning, data science, and machine learning. \n\nAs the Chief Business Officer (CBO) at SPARK Hub, he is committed to empowering youth through innovation and tech literacy. With a passion for discovering insights from data, Manns aspires to make impactful contributions in the field, guided by integrity, kindness, and continuous self-improvement.',
                          style: TextStyle(
                            fontSize: 12,
                          ),
                        ),



                      ],
                      ),
                  ),
                
                  
                  const SizedBox(height: 15), // space between
                  
                  // Logos
                  SizedBox(
                    height: 80,
                    width: double.infinity,
                    //color: Color.fromARGB(26, 126, 126, 126), // Color Guide
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [

                        // WVSU LOGO
                        ClipOval(
                        child: SizedBox(
                          width: 80,
                          height: 80,
                          child: Image.asset(
                            'assets/logos/wvsu.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),

                      const SizedBox(width: 20), // Space between logos

                        // CICT LOGO
                        ClipOval(
                        child: SizedBox(
                          width: 80,
                          height: 80,
                          child: Image.asset(
                            'assets/logos/cict.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),

                      const SizedBox(width: 20), // Space between logos

                        // Spark LOGO
                        ClipOval(
                        child: SizedBox(
                          width: 80,
                          height: 80,
                          child: Image.asset(
                            'assets/logos/spark.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                        
                      ],
                    ),
                  ),
                
                const SizedBox(height: 15), // space between
                
                const Divider(
                  color: Colors.grey,
                  thickness: 1,
                ),

                const SizedBox(height: 15), // space between

                const Text(
                  'PROJECTS',
                  style: TextStyle(
                    color: Color.fromARGB(255, 11, 158, 255),
                    fontWeight: FontWeight.bold,
                    fontSize: 35,
                  )
                ),

                const SizedBox(height: 15), // space between

                // PROJECTS CONTAINER
                Container(
                  padding: const EdgeInsets.only(left: 20, right: 10),
                  width: double.infinity,
                  // color: Color.fromARGB(55, 128, 128, 128),
                  child: Column(
                    children: [

                        // Customer Churn
                        SizedBox(
                          width: double.infinity,
                          //color: Color.fromARGB(55, 128, 128, 128),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,  // Align everything to the top
                            children: [
                                  
                                  // ICON and TEXT
                                  Row(
                                    children: [
                                  // Logo
                                  Image.asset('assets/icons/case_study.png',
                                    width: 50,
                                    height: 50,
                                    fit: BoxFit.cover
                                  ),

                                  const SizedBox(width: 15), // Distance

                                  // Titles
                                  const Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                    
                                    // Title
                                    Text('Customer Churn',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25,
                                      color: Color.fromARGB(255, 11, 158, 255),
                                    )
                                  ),

                                  // Description
                                  Text('Case Study | Technical Lead'),
                                      ],
                                    ),
                                  ],
                                ),

                              // Content
                              const SizedBox(height: 10),
                              const Text('As a technical lead, I spearheaded the development of our machine learning project, SmartBank—Customer Satisfaction Analysis. My role involved coding, choosing and evaluating models like SVM and KNN, and performing data visualization. I ensured the projects success through meticulous data analysis and model training, contributing significantly to the success of this case study.',
                              style: TextStyle(
                                fontSize: 12
                              ),
                              ),
                            ],
                        ),
                        ),

                        // Space
                        const SizedBox(height: 25),

                        // Perapal
                        SizedBox(
                          width: double.infinity,
                          // color: Color.fromARGB(55, 128, 128, 128),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,  // Align everything to the top
                            children: [
                                  
                                  // ICON and TEXT
                                  Row(
                                    children: [
                                  // Logo
                                  Image.asset('assets/icons/perapal.png',
                                    width: 50,
                                    height: 50,
                                    fit: BoxFit.cover
                                  ),

                                  const SizedBox(width: 15), // Distance

                                  // Titles
                                  const Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                    
                                    // Title
                                    Text('Perapal',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25,
                                      color: Color.fromARGB(255, 11, 158, 255),
                                    )
                                  ),

                                  // Description
                                  Text('App Development | Project Manager',
                                  style: TextStyle(fontSize: 12)
                                  ),
                                      ],
                                    ),
                                  ],
                                ),

                              // Content
                              const SizedBox(height: 10),
                              const Text('As a project manager for PeraPal, a budgeting assistance app, I led coding efforts, contributed to system analysis, design documents, and the SRS. Utilizing the Flutter framework, our team developed the app for both Android and browser platforms, providing users with comprehensive financial assistance and budgeting tools.',
                              style: TextStyle(
                                fontSize: 12
                              ),
                              ),
                            ],
                        ),
                        ),

                      const SizedBox(height: 25),

                      // Monika
                      SizedBox(
                          width: double.infinity,
                          //color: Color.fromARGB(55, 128, 128, 128),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,  // Align everything to the top
                            children: [
                                  
                                  // ICON and TEXT
                                  Row(
                                    children: [

                                    ClipOval(
                                      child: SizedBox(
                                        width: 50,
                                        height: 50,
                                        child: Image.asset(
                                          'assets/icons/monika.png',
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),

                                  const SizedBox(width: 15), // Distance

                                  // Titles
                                  const Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                    
                                    // Title
                                    Text('Monika',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25,
                                      color: Color.fromARGB(255, 11, 158, 255),
                                    )
                                  ),

                                  // Description
                                  Text('NLP App | NLP Engineer'),
                                      ],
                                    ),
                                  ],
                                ),

                              // Content
                              const SizedBox(height: 10),
                              const Text('As an NLP engineer for Monika, Im developing an emotion classification model based on Robert Plutchiks Basic Emotions Theory. Using Python and machine learning algorithms like Naive Bayes, SVM, and Logistic Regression, I aim to create a user-friendly mobile app that accurately interprets textual data to categorize emotions. Addressing challenges like data ambiguity and bias, our goal is to provide insightful and inclusive emotional analysis.',
                              style: TextStyle(
                                fontSize: 12
                              ),
                              ),
                            ],
                        ),
                        ),

                      const SizedBox(height: 25),


                      // contacts
                      const SizedBox(
                        height:35,
                        width: double.infinity,
                        //color: const Color.fromARGB(110, 70, 70, 70),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [

                            Row(children: [

                                ImagetoLink(
                                imagePath: 'assets/logos/fb.png',
                                url: 'https://www.facebook.com/hydrawitshs',
                              ),

                              SizedBox(width:10),

                                ImagetoLink(
                                imagePath: 'assets/logos/github.png',
                                url: 'https://github.com/hydraadra112',
                              ),

                              SizedBox(width:10),

                              Text('carado.johnp11q@gmail.com',
                              style: TextStyle(
                                fontFamily: 'Arial',  // Monospace font for email-like appearance
                                fontSize: 10,           // Adjust the size to make it easily readable
                                color: Colors.blue,     // Commonly emails are displayed in blue
                                decoration: TextDecoration.underline, // Underline to mimic link appearance
                              ),
                              )
                              ],
                            ),
                          ],
                          ),
                      ),

                      const Divider(
                      color: Colors.grey,
                      thickness: 1,
                    ),
                      ],
                    ),
                )
                ],
              ),
          )
        )
      )
    );
  }
}