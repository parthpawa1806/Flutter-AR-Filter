import 'package:flutter/material.dart';
import 'dart:math';

import 'package:nailpolish_tryon/camera_page.dart';

class ColorPickerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ColorPickerPage(),
    );
  }
}

class ColorPickerPage extends StatefulWidget {
  @override
  _ColorPickerPageState createState() => _ColorPickerPageState();
}

class _ColorPickerPageState extends State<ColorPickerPage> {
  List<Color> colorList = [];
  Color selectedColor = Colors.transparent;

  @override
  void initState() {
    super.initState();
    generateRandomColors();
  }

  // Function to generate a list of random colors
  void generateRandomColors() {
    Random random = Random();
    for (int i = 0; i < 10; i++) {
      colorList.add(_getRandomColor(random));
    }
  }

  // Function to get a random color
  Color _getRandomColor(Random random) {
    return Color.fromARGB(
      255,
      random.nextInt(256),
      random.nextInt(256),
      random.nextInt(256),
    );
  }

  // Function to handle color selection from the list
  void selectColor(Color color) {
    setState(() {
      selectedColor = color;
    });

    // Navigate to the next page with the selected color
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => HelloWorld(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Color Picker'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Center(
              child: Text(
                'Select a color:',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
          Expanded(
            child: GridView.builder(
              primary: false,
             padding: const EdgeInsets.all(20),
         
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemCount: colorList.length,
              itemBuilder: (context, index) {
                return Card(
                  child: GestureDetector(
                    onTap: () => selectColor(colorList[index]),
                    child: Container(
                      color: colorList[index],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class NextPage extends StatelessWidget {
  final Color selectedColor;

  NextPage({required this.selectedColor});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Next Page'),
      ),
      body: Center(
        child: Container(
          width: 100,
          height: 100,
          color: selectedColor,
        ),
      ),
    );
  }
}
