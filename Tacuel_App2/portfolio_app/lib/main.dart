import 'package:flutter/material.dart';

void main() {
  runApp(const MyPortfolioApp());
}

class MyPortfolioApp extends StatelessWidget {
  const MyPortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PortfolioPage(),
    );
  }
}

class PortfolioPage extends StatelessWidget {
  const PortfolioPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Portfolio App'),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage('assets/images/Figure_3.png'),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Allan Andrews N. Tacuel',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                const Text(
                  'WVSU-CICT: BSCS Student\nDigital 2D Illustrator',
                  style: TextStyle(fontSize: 18, fontStyle: FontStyle.italic),
                ),
                const SizedBox(height: 30),
                const Text(
                  'About Me',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                const Text(
                  'I am digital 2D illustration freelancer, working by commissions. I also go to West Visayas State University as a computer science student currently in the third undergraduate year level.\n\nAlthough it does say that I am taking up CS, none of my skills align with programming, making my adventures in the field more of mis-adventures actually.\n\nMy interests lie on the fields of creative fiction and visual arts. I do 2D illustrations, character/creature design, and concept writing/illustrations.',
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 30),
                const Text(
                  'Skills',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                Wrap(
                  alignment: WrapAlignment.center,
                  spacing: 10,
                  children: const [
                    Chip(label: Text('Digital 2D Illustration (Krita)')),
                    Chip(label: Text('Creative Concept Writing')),
                    Chip(label: Text('Creature Design')),
                    Chip(label: Text('Character Design')),
                    Chip(label: Text('Pen/Pencil and Paper Drawing')),
                  ],
                ),
                const SizedBox(height: 30),
                const Text(
                  'Illustration Projects',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                // Catalog, by year
                ProjectGroup(
                  year: 2022,
                  projects: [
                    ProjectTile(
                      imagePath: 'assets/images/pikamee.png',
                      projectTitle: 'Homage to Amano Pikamee',
                      projectDescription: "I made this illustration to honor of my favorite VTuber Amano Pikamee's graduation.",
                    ),
                    ProjectTile(
                      imagePath: 'assets/images/fordaitiks.png',
                      projectTitle: 'A Familiarization Piece for Krita 1',
                      projectDescription: 'After seeing how horrible my first finished piece is, I decided to dive head-first into Krita to cop a feel of how to navigate and use the software. Here, I practiced line-art',
                    ),
                  ],
                ),
                ProjectGroup(
                  year: 2023,
                  projects: [
                    ProjectTile(
                      imagePath: 'assets/images/krit2.png',
                      projectTitle: 'A Familiarization Piece for Krita 2',
                      projectDescription: 'This is a continuation of my exercise progress, getting my self accustomed to using Krita. Here, I practiced layers.',
                    ),
                    ProjectTile(
                      imagePath: 'assets/images/krit3.png',
                      projectTitle: 'A Familiarization Piece for Krita 3',
                      projectDescription: 'This is a continuation of my exercise progress, getting my self accustomed to using Krita. Here, I practiced my fundamentals; shape language, line weight, values, color contrasts, etc.',
                    ),
                    ProjectTile(
                      imagePath: 'assets/images/Yuul_B_(Not)_Alwright.png',
                      projectTitle: 'Yuul B. (Not) Alwright',
                      projectDescription: "Inspiration just kicked in and I decided that I wanted to draw Ina. She's my favorite VTuber next to Pikamee, primarily because we share vibes being quiet and being artists and she's a 10/10 goth-girl + Lovecraftian theme (Lovecraft my beloved).",
                    ),
                    ProjectTile(
                      imagePath: 'assets/images/rfrgyt.png',
                      projectTitle: 'A Drawing Exercise',
                      projectDescription: 'A piece I made to test-limits and cop out which areas of my fundamentals I need to keep practicing.',
                    ),
                  ],
                ),
                ProjectGroup(
                  year: 2024,
                  projects: [
                    ProjectTile(
                      imagePath: 'assets/images/eyerys.png',
                      projectTitle: 'A Drawing Exercise',
                      projectDescription: "This one's a photo study. I wanted to practice my painting and headed to Pinterest to download the image for reference and my ADHD decided that I want to draw an anime girl instead so I drew Irys, another 10/10 anime girl VTuber.",
                    ),
                    ProjectTile(
                      imagePath: 'assets/images/eva2.png',
                      projectTitle: 'For a Friend',
                      projectDescription: "This one's a piece I assembled in a hurry to put in our comic book project. This wasn't necessary for our comic per se but my friend asked me the favor or making this for fun and so I did.",
                    ),
                    ProjectTile(
                      imagePath: "assets/images/A.Shabet'sJournalChapterUnknown.png",
                      projectTitle: 'A Memoir Entry Piece For My World-Building Project',
                      projectDescription: 'A memoir entry for the worldbuilding project that I am currently writing. Inside this are bunch of illustrations and texts, describing some witch-hunter-guys. This is one of many entries I am concurrently making while also writing so contents are updating all the time because I am the retcon god.',
                    ),
                    ProjectTile(
                      imagePath: 'assets/images/pilandok.png',
                      projectTitle: 'Prototype Character Design Sheet for Reimagination of "Pilandok"',
                      projectDescription: "We have been assigned to make a software startup idea. There weren't any instruction yet but I was trigger-happy about finding out that I CAN MAKE A GAME and so said 'screw backlogs, game nambah 1 prioriteee'. This is getting scrapped btw. What I was planning was to make a video game showcasing the Filipino pantheon and mythos as the main theme. This illustration's a reimagination of a fable character 'Pilandok,' a mouse-deer-furry-man. I am not a furry.",
                    ),
                    ProjectTile(
                      imagePath: 'assets/images/gugurang.png',
                      projectTitle: 'Prototype Character Design Sheet for Reimagination of "Gugurang"',
                      projectDescription: "Gugurang is deity inhabiting the Mayon volcano in Maranao folklore. My interpretation of 'Gugurang' is an old grumpy man that wield the power of a volcano hence the fires. And since he's a spirit, I decided that I wanted to use 'Kapre' as reference for his appearance, being tall and having dark skin (the real reason is design-wise, I like color contrast from bright fire and dark skin for the coolz). He has maranao tattoos that was supposed to be a power system in my game concept.",
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ProjectGroup extends StatelessWidget {
  final int year;
  final List<ProjectTile> projects;

  const ProjectGroup({
    required this.year,
    required this.projects,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [ // FOrmatting
        Text(
          '$year',  // Display year
          style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        ...projects,  // List all projects under 'year'
        const SizedBox(height: 30),
      ],
    );
  }
}

class ProjectTile extends StatefulWidget {
  final String imagePath;
  final String projectTitle;
  final String projectDescription;

  const ProjectTile({
    required this.imagePath,
    required this.projectTitle,
    required this.projectDescription,
  });

  @override
  _ProjectTileState createState() => _ProjectTileState();
}

class _ProjectTileState extends State<ProjectTile> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => FullScreenImage(imagePath: widget.imagePath),
              ),
            );
          },
          child: Image.asset(widget.imagePath),
        ),
        const SizedBox(height: 10),
        Text(
          widget.projectTitle,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 5),
        ElevatedButton(
          onPressed: () {
            setState(() {
              _isExpanded = !_isExpanded;
            });
          },
          child: Text(_isExpanded ? 'Hide Description' : 'View Description'),
        ),
        if (_isExpanded)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              widget.projectDescription,
              textAlign: TextAlign.center,
            ),
          ),
        const SizedBox(height: 20),
      ],
    );
  }
}

class FullScreenImage extends StatelessWidget {
  final String imagePath;

  const FullScreenImage({required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      body: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Center(
          child: Image.asset(imagePath),
        ),
      ),
      backgroundColor: Colors.black,
    );
  }
}
