import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';

void main() => runApp(XylophoneApp());

List<Color> sevenColors =[Colors.red,Colors.purple,Colors.yellow,Colors.blue,Colors.green,Colors.teal,Colors.purple];

void playSound(int soundNumber) {
  final player = AudioCache();
  player.play('note$soundNumber.wav');
}

Widget buildKey(Color color, int numberSound)
{
  return Expanded(
    child: Container(
        child: FlatButton(
          color: color,
          onPressed: () {
            playSound(numberSound);
          },
        )),
  );
}

List<Widget> keyboard(List<Color> colors)
{
  List<Widget> listKeys = [];
  for(int i = 0; i<colors.length; i++)
    {
     listKeys.add(buildKey(colors[i], i+1));
    }
  return listKeys;
}

class XylophoneApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(

          child: Column(crossAxisAlignment: CrossAxisAlignment.stretch,
            children: keyboard(sevenColors),
          ),
        ),
      ),
    );
  }
}
