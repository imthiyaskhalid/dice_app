import 'package:flutter/material.dart';
import 'dart:math';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.green.shade900,
        appBar: AppBar(
          backgroundColor: Colors.green.shade900,
        ),
        body: const DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  const DicePage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int diceNumber = 1;
  late AudioCache audioCache;
  late AudioPlayer audioPlayer;

  @override
  void initState() {
    super.initState();
    audioCache = AudioCache();
    audioPlayer = AudioPlayer();
    audioCache.load('audio/dicesound.mp3');
  }

  void rollDice() async {
    // Use the AudioCache to get an AudioPlayer instance and handle playback
    //audioPlayer = await audioCache.play('audio/dicesound.mp3');

    setState(() {
      diceNumber = 0; // Show a blank or different image to indicate rolling
    });

    // Simulate rolling with a delay
    await Future.delayed(const Duration(milliseconds: 500)); // Adjust duration as needed

    setState(() {
      diceNumber = Random().nextInt(6) + 1;
      //print('$diceNumber Button pressed');
    });
  }

  @override
Widget build(BuildContext context) {
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'DICE',
          style: TextStyle(
            color: Colors.white,
            fontSize: 60,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.normal, 
            fontFamily: 'Playball',
          ),
        ),
        const SizedBox(height: 120), // Spacer between text and the button
        SizedBox(
          height: 150.0,
          width: 150.0,
          child: TextButton(
            style: TextButton.styleFrom(
              foregroundColor: Colors.green.shade900,
            ),
            onPressed: rollDice,
            child: Image.asset('images/dice$diceNumber.png'),
          ),
        ),
      ],
    ),
  );
}
}
