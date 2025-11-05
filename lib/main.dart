import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(ColorChangerApp());
}

class ColorChangerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Color Changer App', home: ColorChangerHome());
  }
}

class ColorChangerHome extends StatefulWidget {
  @override
  _ColorChangerHomeState createState() => _ColorChangerHomeState();
}

class _ColorChangerHomeState extends State<ColorChangerHome> {
  Color _color1 = Colors.blue;
  Color _color2 = Colors.lightBlue;

  int _red = 0, _green = 0, _blue = 0;

  final List<Alignment> _beginAlignments = [
    Alignment.topCenter,
    Alignment.centerLeft,
    Alignment.topLeft,
    Alignment.topRight,
  ];

  final List<Alignment> _endAlignments = [
    Alignment.bottomCenter,
    Alignment.centerRight,
    Alignment.bottomRight,
    Alignment.bottomLeft,
  ];

  final List<String> _directionLabels = [
    'Vertical',
    'Horizontal',
    'Left-Right',
    'Right-Left',
  ];

  int _directionIndex = 0;

  void _changeColor() {
    final random = Random();
    setState(() {
      _red = random.nextInt(256);
      _green = random.nextInt(256);
      _blue = random.nextInt(256);
      _color1 = Color.fromARGB(255, _red, _green, _blue);
      _color2 = _color1.withOpacity(0.8);
    });
  }

  void _changeDirection() {
    setState(() {
      _directionIndex = (_directionIndex + 1) % 4;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: _beginAlignments[_directionIndex],
            end: _endAlignments[_directionIndex],
            colors: [_color1, _color2],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: _changeColor,
                child: Text("Change Color"),
              ),
              SizedBox(height: 10),
              Text(
                'Red: $_red Green: $_green Blue: $_blue',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: _changeDirection,
                child: Text("Change Direction"),
              ),
              SizedBox(height: 10),
              Text(
                'Direction: ${_directionLabels[_directionIndex]}',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
