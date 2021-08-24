import 'package:car_race_quiz_plan_b/widget/answer.dart';
import 'package:car_race_quiz_plan_b/widget/gameScreen.dart';
import 'package:car_race_quiz_plan_b/widget/questionCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:confetti/confetti.dart';
import 'package:assets_audio_player/assets_audio_player.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  ConfettiController? _confettiController;
  AssetsAudioPlayer winAudio = AssetsAudioPlayer();
  AssetsAudioPlayer failAudio = AssetsAudioPlayer();
  AssetsAudioPlayer raceAudio = AssetsAudioPlayer();

  @override
  void dispose() {
    _confettiController!.dispose();
    winAudio.dispose();
    failAudio.dispose();
    raceAudio.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _confettiController =
        ConfettiController(duration: Duration(milliseconds: 500));

    super.initState();

    winAudio.open(
      Audio('assets/audio/clap.wav'),
      autoStart: false,
      //showNotification: true
    );
    failAudio.open(
      Audio('assets/audio/fail.mp3'),
      autoStart: false,
      //showNotification: true
    );
    raceAudio.open(
      Audio('assets/audio/race.wav'),
      autoStart: false,
      //showNotification: true
    );
  }

  int _questionIndex = 0;
  bool answerWasSelected = false;
  double car1x = -1;
  double car2x = -1;
  Text text = Text('');
  bool youWon = false;
  bool youLose = false;

  void questionAnswered(bool answerScore) {
    setState(() {
      //anser was selected
      answerWasSelected = true;

      //check if answer was correct
      if (answerScore) {
        if (car2x < 1) {
          raceAudio.play();
          car2x = car2x + .4;
        } else {
          youWon = true;
          winAudio.play();
          _confettiController!.play();
          text = Text(
            'Congratulations !!!',
            style: TextStyle(
                color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
          );
        }
      } else {
        if (car1x < 1) {
          raceAudio.play();
          car1x = car1x + .4;
        } else {
          youLose = true;
          failAudio.play();
          text = Text(
            'SORRY !!!',
            style: TextStyle(
                color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
          );
        }
      }
      _questionIndex++;
      answerWasSelected = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);
    return Scaffold(
      body: Column(
        children: [
          GameScreen(
              car1x: car1x,
              car2x: car2x,
              confettiController: _confettiController),
          QuestionCard(
              youWon: youWon,
              youLose: youLose,
              questionIndex: _questionIndex,
              text: text),

          //Answer Card
          Expanded(
              child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(color: Colors.pink.shade900),
                  child: youWon == false && youLose == false
                      ? Row(
                          children: [
                            ...(_questions[_questionIndex]['answers']
                                    as List<Map<String, Object>>)
                                .map((answer) => Answer(
                                      answerText: '${answer['answerText']}',
                                      answerColor: answerWasSelected
                                          ? answer['score'] == true
                                              ? Colors.green
                                              : Colors.red
                                          : Colors.pink,
                                      answerTap: () {
                                        questionAnswered(
                                            answer['score'] == true);
                                      },
                                    )),
                          ],
                        )
                      : youWon == true
                          ? Center(
                              child: Text(
                                'You Won The Race 😀',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 40,
                                    fontWeight: FontWeight.bold),
                              ),
                            )
                          : youLose == true
                              ? Center(
                                  child: Text(
                                    'You Lose The Race 😞',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 40,
                                        fontWeight: FontWeight.bold),
                                  ),
                                )
                              : null))
        ],
      ),
    );
  }
}

final _questions = const [
  {
    'question': 'How long is New Zealand’s Ninety Mile Beach?',
    'answers': [
      {'answerText': '88km, so 55 miles long.', 'score': true},
      {'answerText': '55km, so 34 miles long.', 'score': false},
    ],
  },
  {
    'question':
        'In which month does the German festival of Oktoberfest mostly take place?',
    'answers': [
      {'answerText': 'October', 'score': false},
      {'answerText': 'September', 'score': true},
    ],
  },
  {
    'question': 'Who composed the music for Sonic the Hedgehog 3?',
    'answers': [
      {'answerText': 'Britney Spears', 'score': false},
      {'answerText': 'Michael Jackson', 'score': true},
    ],
  },
  {
    'question': 'In Georgia (the state), it’s illegal to eat what with a fork?',
    'answers': [
      {'answerText': 'Hamburgers', 'score': false},
      {'answerText': 'Fried chicken', 'score': true},
    ],
  },
  {
    'question': 'Fastest Animal In The World?',
    'answers': [
      {'answerText': 'Cheetah', 'score': true},
      {'answerText': 'Slooth', 'score': false},
    ],
  },
  {
    'question': 'Who composed the music for Sonic the Hedgehog 3?',
    'answers': [
      {'answerText': 'Britney Spears', 'score': false},
      {'answerText': 'Michael Jackson', 'score': true},
    ],
  },
  {
    'question': 'In Georgia (the state), it’s illegal to eat what with a fork?',
    'answers': [
      {'answerText': 'Hamburgers', 'score': false},
      {'answerText': 'Fried chicken', 'score': true},
    ],
  },
  {
    'question': 'Fastest Animal In The World?',
    'answers': [
      {'answerText': 'Cheetah', 'score': true},
      {'answerText': 'Slooth', 'score': false},
    ],
  },
  {
    'question': 'Who composed the music for Sonic the Hedgehog 3?',
    'answers': [
      {'answerText': 'Britney Spears', 'score': false},
      {'answerText': 'Michael Jackson', 'score': true},
    ],
  },
  {
    'question': 'In Georgia (the state), it’s illegal to eat what with a fork?',
    'answers': [
      {'answerText': 'Hamburgers', 'score': false},
      {'answerText': 'Fried chicken', 'score': true},
    ],
  },
  {
    'question': 'Fastest Animal In The World?',
    'answers': [
      {'answerText': 'Cheetah', 'score': true},
      {'answerText': 'Slooth', 'score': false},
    ],
  },
];
