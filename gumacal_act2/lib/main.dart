// ignore_for_file: unused_field, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Notepad',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const NotepadScreen(),
    );
  }
}

class NotepadScreen extends StatefulWidget {
  const NotepadScreen({super.key});

  @override
  _NotepadScreenState createState() => _NotepadScreenState();
}

class _NotepadScreenState extends State<NotepadScreen> {
  final _textController = TextEditingController();
  List<String> _savedNotes = [];
  final String _currentNoteFile = '';

  @override
  void initState() {
    super.initState();
    _loadSavedNotes();
  }

  Future<void> _saveNote() async {
    if (_textController.text.isEmpty) return;

    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/note${_savedNotes.length + 1}.txt');
    await file.writeAsString(_textController.text);

    setState(() {
      _savedNotes.add(file.path);
      _textController.clear();
    });
  }

  Future<void> _loadSavedNotes() async {
    final directory = await getApplicationDocumentsDirectory();
    final files = directory
        .listSync()
        .where((file) => file.path.endsWith('.txt'))
        .toList();

    setState(() {
      _savedNotes = files.map((file) => file.path).toList();
    });
  }

  Future<String> _readNoteFromFile(String path) async {
    final file = File(path);
    return await file.readAsString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Notepad'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Saved Notes'),
            ),
            ..._savedNotes.map((notePath) => ListTile(
                  title: Text(notePath.split('/').last),
                  onTap: () async {
                    final noteContent = await _readNoteFromFile(notePath);
                    _textController.text = noteContent;
                    Navigator.of(context).pop();
                  },
                )),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: TextField(
                controller: _textController,
                maxLines: null,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Start typing...',
                ),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _saveNote,
              child: const Text('Save Note'),
            ),
          ],
        ),
      ),
    );
  }
}
