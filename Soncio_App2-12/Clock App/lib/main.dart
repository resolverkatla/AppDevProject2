import 'dart:async';
import 'package:flutter/material.dart';

void main() {
  runApp(const ClockApp());
}

class ClockApp extends StatelessWidget {
  const ClockApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Clock App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ClockHomePage(),
    );
  }
}

class ClockHomePage extends StatefulWidget {
  const ClockHomePage({Key? key}) : super(key: key);

  @override
  _ClockHomePageState createState() => _ClockHomePageState();
}

class _ClockHomePageState extends State<ClockHomePage> {
  late String _timeString;

  @override
  void initState() {
    super.initState();
    _timeString = _formatDateTime(DateTime.now());
    Timer.periodic(const Duration(seconds: 1), (Timer t) => _getTime());
  }

  void _getTime() {
    final DateTime now = DateTime.now();
    final String formattedDateTime = _formatDateTime(now);
    setState(() {
      _timeString = formattedDateTime;
    });
  }

  String _formatDateTime(DateTime dateTime) {
    return "${dateTime.hour.toString().padLeft(2, '0')}:${dateTime.minute.toString().padLeft(2, '0')}:${dateTime.second.toString().padLeft(2, '0')}";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Simple Clock'),
      ),
      body: Center(
        child: Text(
          _timeString,
          style: const TextStyle(
            fontSize: 48,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}