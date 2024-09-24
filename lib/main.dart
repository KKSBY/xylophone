import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
import 'package:just_audio/just_audio.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  final player = AudioPlayer();

  final ButtonStyle flatButtonStyle = TextButton.styleFrom(
    minimumSize: Size(88, 36),
    padding: EdgeInsets.symmetric(horizontal: 16),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(2)),
    ),
  );

  void playSound(int soundNumber) {
    player.setAsset('assets/note$soundNumber.wav');
    player.play();
  }

  Expanded buildKey({required Color color, required int soundNumber}) {
    return Expanded(
      child: FractionallySizedBox(
        widthFactor: 1.0,
        child: TextButton(
          style: flatButtonStyle,
          onPressed: () {
            playSound(soundNumber);
          },
          child: Container(
            color: color,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              buildKey(color: Colors.red, soundNumber: 1),
              buildKey(color: Colors.orange, soundNumber: 2),
              buildKey(color: Colors.yellow, soundNumber: 3),
              buildKey(color: Colors.green, soundNumber: 4),
              buildKey(color: Colors.blue, soundNumber: 5),
              buildKey(color: Colors.indigo, soundNumber: 6),
              buildKey(color: Colors.purple, soundNumber: 7),
            ],
          ),
        ),
      ),
    );
  }
}
