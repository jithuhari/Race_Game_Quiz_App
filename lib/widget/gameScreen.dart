import 'package:car_race_quiz_plan_b/widget/confettiAnimation.dart';
import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({
    Key? key,
    required this.car1x,
    required this.car2x,
    required ConfettiController? confettiController,
  }) : _confettiController = confettiController, super(key: key);

  final double car1x;
  final double car2x;
  final ConfettiController? _confettiController;

  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Container(
        //alignment: Alignment.center,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height / 2,
        child: Stack(
          children: [
            Image(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                fit: BoxFit.fill,
                image: AssetImage('assets/images/city.jpg')),
            Container(
              alignment: Alignment(widget.car1x, 0),
              //width: MediaQuery.of(context).size.width*.5,
              //height:MediaQuery.of(context).size.height*.5 ,
              child: Image(
                  height: MediaQuery.of(context).size.height * .9,
                  image: AssetImage('assets/images/car2.png')),
            ),
            Container(
              alignment: Alignment(widget.car2x, 0),
              //width: MediaQuery.of(context).size.width*.5,
              //height:MediaQuery.of(context).size.height*.5 ,
              child: Image(image: AssetImage('assets/images/car1.png')),
            ),
            ConfettiAnimation(confettiController: widget._confettiController),
          ],
        ),
      ),
    );
  }
}
