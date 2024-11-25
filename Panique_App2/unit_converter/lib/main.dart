import 'package:flutter/material.dart';

void main() {
  runApp(UnitConverterApp());
}

class UnitConverterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Unit Converter',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: UnitConverterHome(),
    );
  }
}

class UnitConverterHome extends StatefulWidget {
  @override
  _UnitConverterHomeState createState() => _UnitConverterHomeState();
}

class _UnitConverterHomeState extends State<UnitConverterHome> {
  final TextEditingController _inputController = TextEditingController();
  String _selectedCategory = 'Length';
  String _selectedUnitFrom = 'Meters';
  String _selectedUnitTo = 'Kilometers';
  double _convertedValue = 0.0;

  final Map<String, List<String>> _units = {
    'Length': ['Meters', 'Kilometers', 'Miles', 'Yards'],
    'Weight': ['Kilograms', 'Grams', 'Pounds', 'Ounces'],
    'Temperature': ['Celsius', 'Fahrenheit'],
  };

  void _convert() {
    final inputValue = double.tryParse(_inputController.text);
    if (inputValue == null) return;

    setState(() {
      if (_selectedCategory == 'Length') {
        if (_selectedUnitFrom == 'Meters' && _selectedUnitTo == 'Kilometers') {
          _convertedValue = inputValue / 1000;
        } else if (_selectedUnitFrom == 'Kilometers' && _selectedUnitTo == 'Meters') {
          _convertedValue = inputValue * 1000;
        }
        // Add more cases for length units
      } else if (_selectedCategory == 'Weight') {
        if (_selectedUnitFrom == 'Kilograms' && _selectedUnitTo == 'Grams') {
          _convertedValue = inputValue * 1000;
        } else if (_selectedUnitFrom == 'Grams' && _selectedUnitTo == 'Kilograms') {
          _convertedValue = inputValue / 1000;
        }
        // Add more cases for weight units
      } else if (_selectedCategory == 'Temperature') {
        if (_selectedUnitFrom == 'Celsius' && _selectedUnitTo == 'Fahrenheit') {
          _convertedValue = (inputValue * 9 / 5) + 32;
        } else if (_selectedUnitFrom == 'Fahrenheit' && _selectedUnitTo == 'Celsius') {
          _convertedValue = (inputValue - 32) * 5 / 9;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Unit Converter'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            DropdownButton<String>(
              value: _selectedCategory,
              onChanged: (value) {
                setState(() {
                  _selectedCategory = value!;
                  _selectedUnitFrom = _units[_selectedCategory]![0];
                  _selectedUnitTo = _units[_selectedCategory]![1];
                });
              },
              items: _units.keys.map((category) {
                return DropdownMenuItem(
                  value: category,
                  child: Text(category),
                );
              }).toList(),
            ),
            SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: DropdownButton<String>(
                    value: _selectedUnitFrom,
                    onChanged: (value) {
                      setState(() {
                        _selectedUnitFrom = value!;
                      });
                    },
                    items: _units[_selectedCategory]!.map((unit) {
                      return DropdownMenuItem(
                        value: unit,
                        child: Text(unit),
                      );
                    }).toList(),
                  ),
                ),
                Icon(Icons.swap_horiz),
                Expanded(
                  child: DropdownButton<String>(
                    value: _selectedUnitTo,
                    onChanged: (value) {
                      setState(() {
                        _selectedUnitTo = value!;
                      });
                    },
                    items: _units[_selectedCategory]!.map((unit) {
                      return DropdownMenuItem(
                        value: unit,
                        child: Text(unit),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            TextField(
              controller: _inputController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Enter value',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _convert,
              child: Text('Convert'),
            ),
            SizedBox(height: 16),
            Text(
              'Converted Value: $_convertedValue',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
