import 'package:flutter/material.dart';
import 'resistor.dart';

class ResistorScreen extends StatefulWidget {
  @override
  _ResistorScreenState createState() => _ResistorScreenState();
}

class _ResistorScreenState extends State<ResistorScreen> {
  final Resistor resistor = Resistor();

  final TextEditingController band1Controller = TextEditingController();
  final TextEditingController band2Controller = TextEditingController();
  final TextEditingController multiplierController = TextEditingController();

  String result = '';

  void calculate() {
    String band1 = band1Controller.text.trim();
    String band2 = band2Controller.text.trim();
    String multiplier = multiplierController.text.trim();

    setState(() {
      result = resistor.calculateResistance(band1, band2, multiplier);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Resistor Calculator'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildColorReference(),
            SizedBox(height: 20),
            Text(
              'Enter the color names for each band:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            _buildTextField('Band 1', band1Controller),
            SizedBox(height: 10),
            _buildTextField('Band 2', band2Controller),
            SizedBox(height: 10),
            _buildTextField('Multiplier', multiplierController),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: calculate,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal,
                padding: EdgeInsets.symmetric(vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text(
                'Calculate',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 20),
            if (result.isNotEmpty)
              Card(
                color: Colors.white,
                margin: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'Resistance: $result',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueGrey.shade800,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        filled: true,
        fillColor: Colors.white.withOpacity(0.9),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }

  Widget _buildColorReference() {
    final Map<String, String> colorResistorValues = resistor.getColorResistorValues();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          'Color Codes Reference:',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 10),
        Wrap(
          spacing: 10,
          runSpacing: 10,
          alignment: WrapAlignment.center,
          children: colorResistorValues.entries.map((entry) {
            return Container(
              padding: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: _getColor(entry.key),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    entry.key[0].toUpperCase() + entry.key.substring(1),
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    entry.value,
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  Color _getColor(String color) {
    switch (color) {
      case 'black':
        return Colors.black;
      case 'brown':
        return Colors.brown;
      case 'red':
        return Colors.red;
      case 'orange':
        return Colors.orange;
      case 'yellow':
        return Colors.yellow;
      case 'green':
        return Colors.green;
      case 'blue':
        return Colors.blue;
      case 'violet':
        return Colors.purple;
      case 'gray':
        return Colors.grey;
      case 'white':
        return Colors.white;
      default:
        return Colors.transparent;
    }
  }

  @override
  void dispose() {
    band1Controller.dispose();
    band2Controller.dispose();
    multiplierController.dispose();
    super.dispose();
  }
}
