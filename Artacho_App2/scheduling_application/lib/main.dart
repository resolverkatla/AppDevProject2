import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Application',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // THE HEADER OF THE MAIN SCREEN
      appBar: AppBar(
        title: Text('Weekly Schedule'),
        backgroundColor: Colors.blue.withOpacity(0.5),
      ),
      // DRAWER IS THE ICON ON THE LEFTMOST OF APPBAR 
      drawer: SideBar(),
      // THE BODY OF THE MAIN SCREEN
      body: Column(
        children: [
          Expanded(
            child: ScheduleGrid(),
          ),
        ],
      ),
    );
  }
}

// THE SIDEBAR CLASS. PRIMARILY FUNCTIONS FOR THE SIDEBAR OPERATIONS
class SideBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          // PROFILE AREA. IT CONTAINS THE PROFILE PICTURE AND THE NAMECARD
          Stack(
            children: [
              Container(
                width: double.infinity,
                height: 230,
                color: Colors.blue.withOpacity(0.5),          
              ),

              Positioned(
                left: 18,
                top: 49,
                child: ClipOval(
                  child: Image.asset(
                    'assets/images/profile_pic.jpg',
                    width: 75,
                    height: 75,
                    fit: BoxFit.cover, 
                  ),
                ),
              ),

              Positioned(
                left: 118 - 194 / 2 - 3,
                top: 144,
                child: Container(
                  width: 194,
                  height: 44,
                  color: Colors.white,
                  child: Center(
                    child: Text('Cristopher Ian Artacho', style: TextStyle(color: Colors.black)),
                  ),
                ),
              ),
            ],
          ),
          // A CONTAINER FOR THE EDIT PROFILE
          ListTile(
            title: Text('Edit Profile'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          // A CONTAINER FOR THE SETTINGS
          ListTile(
            title: Text('Settings'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          // A CONTAINER FOR ABOUT
          ListTile(
            title: Text('About'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
// THE SCHEDULE GRID SECTION. RESPONSIBLE FOR THE SCHEDULING WITH THE USE OF TABLES AND DRAGGING OPERATIONS
class ScheduleGrid extends StatefulWidget {
  @override
  _ScheduleGridState createState() => _ScheduleGridState();
}
// THE FIRST COLUMN AS TIME AND THE THE REST WEEK HEADERS 
class _ScheduleGridState extends State<ScheduleGrid> {
  // THE FIRST COLUMN AS TIME AND THE THE REST WEEK HEADERS
  final List<String> timeSlots = List.generate(14, (i) => '${7 + i}:00 AM');
  final List<String> days = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday'];


  List<List<String?>> schedule = List.generate(14, (_) => List<String?>.filled(6, null));

  int? _draggingStartIndex;
  int? _draggingEndIndex;
  int? _currentDraggingDay;

  void addSchedule(int dayIndex, int startIndex, int endIndex) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        TextEditingController controller = TextEditingController();
        return AlertDialog(
          title: Text('Add Schedule'),
          content: TextField(
            controller: controller,
            decoration: InputDecoration(hintText: "Enter schedule detail"),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                setState(() {
                  for (int i = startIndex; i <= endIndex; i++) {
                    schedule[i][dayIndex] = controller.text;
                  }
                });
                Navigator.of(context).pop();
              },
              child: Text('Save'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      thumbVisibility: true,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: ConstrainedBox(
          constraints: BoxConstraints(minWidth: MediaQuery.of(context).size.width),
          child: Scrollbar(
            thumbVisibility: true,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Table(
                border: TableBorder.all(),
                columnWidths: {
                  0: FixedColumnWidth(100.0),
                },
                children: [
                  TableRow(
                    children: [
                      TableCell(
                        child: Container(
                          padding: EdgeInsets.all(8.0),
                          child: Center(child: Text('Time')),
                          color: Colors.grey[200],
                        ),
                      ),
                      ...days.map((day) => TableCell(
                        child: Container(
                          padding: EdgeInsets.all(8.0),
                          child: Center(child: Text(day)),
                          color: Colors.grey[200],
                        ),
                      )).toList(),
                    ],
                  ),
                  ...List.generate(timeSlots.length, (timeIndex) {
                    return TableRow(
                      children: [
                        TableCell(
                          child: SizedBox(
                            width: 100.0,
                            child: Center(child: Text(timeSlots[timeIndex])),
                          ),
                        ),
                        ...List.generate(days.length, (dayIndex) {
                          return TableCell(
                            child: GestureDetector(
                              onPanStart: (details) {
                                setState(() {
                                  _draggingStartIndex = timeIndex;
                                  _draggingEndIndex = timeIndex;
                                  _currentDraggingDay = dayIndex;
                                });
                              },
                              onPanUpdate: (details) {
                                setState(() {
                                  double dragPosition = details.localPosition.dy;
                                  int newEndIndex = _draggingStartIndex! + (dragPosition ~/ 50);
                                  newEndIndex = newEndIndex.clamp(0, timeSlots.length - 1);
                                  _draggingEndIndex = newEndIndex;
                                });
                              },
                              onPanEnd: (details) {
                                if (_draggingStartIndex != null &&
                                    _draggingEndIndex != null &&
                                    _currentDraggingDay != null) {
                                  int start = _draggingStartIndex!;
                                  int end = _draggingEndIndex!;
                                  if (start > end) {
                                    int temp = start;
                                    start = end;
                                    end = temp;
                                  }
                                  addSchedule(_currentDraggingDay!, start, end);
                                }
                                setState(() {
                                  _draggingStartIndex = null;
                                  _draggingEndIndex = null;
                                  _currentDraggingDay = null;
                                });
                              },
                              child: Container(
                                height: 50,
                                color: schedule[timeIndex][dayIndex] != null
                                    ? Colors.lightBlueAccent
                                    : (_draggingStartIndex != null &&
                                            _draggingEndIndex != null &&
                                            _currentDraggingDay == dayIndex &&
                                            timeIndex >= _draggingStartIndex! &&
                                            timeIndex <= _draggingEndIndex!)
                                        ? Colors.lightBlue.withOpacity(0.5)
                                        : Colors.white,
                                child: Center(
                                  child: Text(
                                    schedule[timeIndex][dayIndex] ?? '',
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ),
                          );
                        }),
                      ],
                    );
                  }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
