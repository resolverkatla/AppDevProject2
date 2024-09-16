import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'To-Do List',
      theme: ThemeData(fontFamily: 'Poppins'),
      home: const MyHomePage(),
    );
  }
}

class Task {
  String name;
  bool isCompleted;

  Task(this.name, this.isCompleted);
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Task> _tasks = [
    Task("Task 1", false),
    Task("Task 2", false),
    Task("Task 3", false),
  ];

  final List<Task> _completedTasks = [];

  void _toggleTask(Task task) {
    setState(() {
      task.isCompleted = !task.isCompleted;
      if (task.isCompleted) {
        _tasks.remove(task);
        _completedTasks.add(task);
      } else {
        _completedTasks.remove(task);
        _tasks.add(task);
      }
    });
  }

  void _editTask(Task task) {
    TextEditingController taskController =
        TextEditingController(text: task.name);

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Edit Task'),
          content: TextField(
            controller: taskController,
            decoration: const InputDecoration(hintText: "Enter new task name"),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); 
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  task.name = taskController.text; 
                });
                Navigator.of(context).pop(); 
              },
              child: const Text('Save'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF3F4F8),
      appBar: AppBar(
        backgroundColor: const Color(0xffF9476C),
        title: const Text(
          'To-do List',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Color(0xFFF3F4F8),
          ),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(
          color: Color(
              0xFFF3F4F8), 
        ),
      ),
      drawer: Drawer(
        child: Container(
          color: const Color(0xFFF3F4F8),
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              const UserAccountsDrawerHeader(
                accountName: Text("Kim Jiwoong"),
                accountEmail: Text("kimjiwoong98@naver.com"),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: AssetImage('images/jw.jpg'),
                ),
                decoration: BoxDecoration(
                  color: Color(0xffF9476C),
                ),
              ),
              ListTile(
                title: const Text('Completed Tasks'),
                onTap: () {
                  Navigator.pop(context); 
                  showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return _completedTasks.isEmpty
                          ? const Center(
                              child: Padding(
                                padding: EdgeInsets.all(20.0),
                                child: Text('No completed tasks yet!'),
                              ),
                            )
                          : ListView(
                              children: _completedTasks
                                  .map((task) =>
                                      ListTile(title: Text(task.name)))
                                  .toList(),
                            );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const Text(
              "Your Tasks",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: _tasks.isEmpty
                  ? const Center(child: Text('No tasks left!'))
                  : ListView.builder(
                      itemCount: _tasks.length,
                      itemBuilder: (context, index) {
                        return Dismissible(
                          key: Key(_tasks[index].name),
                          onDismissed: (direction) {
                            _toggleTask(_tasks[index]);
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content:
                                    Text("${_tasks[index].name} completed"),
                              ),
                            );
                          },
                          background: Container(color: Colors.green),
                          child: ListTile(
                            title: Text(_tasks[index].name),
                            trailing: Wrap(
                              spacing: 12, 
                              children: <Widget>[
                                IconButton(
                                  icon: const Icon(Icons.edit),
                                  onPressed: () {
                                    _editTask(_tasks[index]);
                                  },
                                ),
                                IconButton(
                                  icon: const Icon(Icons.check),
                                  onPressed: () {
                                    _toggleTask(_tasks[index]);
                                  },
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _tasks.add(Task("New Task", false));
          });
        },
        backgroundColor:
            const Color(0xffF9476C), 
        foregroundColor: const Color(0xFFF3F4F8),
        child: const Icon(Icons.add),
      ),
    );
  }
}
