import 'package:flame/experimental.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/material.dart';
import 'package:ludo_game/main.dart';
import 'package:confetti/confetti.dart';
class EndGame extends StatefulWidget {
  final GamePlayer;
  final Winner;
  const EndGame({super.key,this.GamePlayer,this.Winner});

  @override
  State<EndGame> createState() => _EndGameState();
}

class _EndGameState extends State<EndGame> {
  late ConfettiController _confettiController;

  @override
  void initState() {
    super.initState();
    _confettiController = ConfettiController(duration: Duration(seconds: 3));
    FlameAudio.play("game-music.mp3");
    _confettiController.play();

  }

  @override
  void dispose() {
    _confettiController.dispose();
    super.dispose();
  }
  var C = [
    Color.fromARGB(255,239,151,187),
    Colors.purple,
    Colors.brown,
    Colors.grey,
    Colors.blue,
    Color.fromARGB(255, 175, 67, 60)
  ];
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: C[0],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("W i n s  P l a y e r",style: TextStyle(fontSize: 40,color: C[1],fontWeight: FontWeight.bold),),
            ConfettiWidget(
              confettiController: _confettiController,
              blastDirection: -1.5, // Upward direction
              emissionFrequency: 0.20, // How often particles are emitted
              numberOfParticles: 300, // Number of confetti pieces
              gravity: 0.01, // Gravity effect

            ),
            EndGame(GamePlayer,Winner)
          ],
        ),
      ),
    );
  }
  EndGame(GamePlayer,Winner)
  {

    return GamePlayer==2 ?Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text("1st ${Winner[0]}",style: TextStyle(fontSize: 30,color: C[2],fontWeight: FontWeight.bold),),
        Text("2nd ${Winner[1]}",style: TextStyle(fontSize: 25,color: C[3],fontWeight: FontWeight.bold))
      ],
    ):GamePlayer==3?Column(
      children: [
        Text("1st  ${Winner[0]}",style: TextStyle(fontSize: 30,color: C[2],fontWeight: FontWeight.bold),),
        Text("2nd  ${Winner[1]}",style: TextStyle(fontSize: 25,color: C[3],fontWeight: FontWeight.bold)),
        Text("3rd  ${Winner[2]}",style: TextStyle(fontSize: 20,color: C[4],fontWeight: FontWeight.bold),),
      ],
    ):Column(
      children: [
        Text("1st  ${Winner[0]}",style: TextStyle(fontSize: 30,color: C[2],fontWeight: FontWeight.bold),),
        Text("2nd  ${Winner[1]}",style: TextStyle(fontSize: 25,color: C[3],fontWeight: FontWeight.bold)),
        Text("3rd  ${Winner[2]}",style: TextStyle(fontSize: 20,color: C[4],fontWeight: FontWeight.bold),),
        Text("4th  ${Winner[3]}",style: TextStyle(fontSize: 15,color: C[5],fontWeight: FontWeight.bold),),
      ],
    );
  }
}
