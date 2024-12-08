class Resistor {
  final Map<String, int> colorCode = {
    'black': 0,
    'brown': 1,
    'red': 2,
    'orange': 3,
    'yellow': 4,
    'green': 5,
    'blue': 6,
    'violet': 7,
    'gray': 8,
    'white': 9,
  };

  String calculateResistance(String band1, String band2, String multiplier) {
    band1 = band1.toLowerCase();
    band2 = band2.toLowerCase();
    multiplier = multiplier.toLowerCase();

    if (!colorCode.containsKey(band1) ||
        !colorCode.containsKey(band2) ||
        !colorCode.containsKey(multiplier)) {
      return 'Invalid colors entered.';
    }

    int value = colorCode[band1]! * 10 + colorCode[band2]!;
    int multiplierValue = colorCode[multiplier]!;
    int resistance = value * (10 ^ multiplierValue);

    return resistance >= 1000
        ? '${(resistance / 1000).toStringAsFixed(2)} kΩ'
        : '${resistance.toStringAsFixed(2)} Ω';
  }

  Map<String, String> getColorResistorValues() {
    return {
      'black': '1Ω',
      'brown': '10Ω',
      'red': '100Ω',
      'orange': '1kΩ',
      'yellow': '10kΩ',
      'green': '100kΩ',
      'blue': '1MΩ',
      'violet': '10MΩ',
      'gray': '100MΩ',
      'white': '1GΩ',
    };
  }
}
