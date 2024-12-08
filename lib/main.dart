import 'package:flutter/material.dart';
import 'resistor_screen.dart';

void main() {
  runApp(ElectronicsApp());
}

class ElectronicsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Electronics App',
      theme: ThemeData(primarySwatch: Colors.blueGrey),
      home: ResistorScreen(),
    );
  }
}
