import 'package:car_race_quiz_plan_b/widget/answer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
        if(car2x<1){
        car2x = car2x + .4;
        }
        else{
          youWon =true;
          text = Text('Congratulations !!!',
          style:TextStyle(
            color: Colors.white,
            fontSize: 25,
            fontWeight: FontWeight.bold
            ),
          );
        }
      }else{

        if(car1x<1){
        car1x = car1x + .4;
        }
        else{
          youLose =true;
          text = Text('SORRY !!!',
          style:TextStyle(
            color: Colors.white,
            fontSize: 25,
            fontWeight: FontWeight.bold
            ),
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
          Expanded(
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
                    alignment: Alignment(car1x, 0),
                    //width: MediaQuery.of(context).size.width*.5,
                    //height:MediaQuery.of(context).size.height*.5 ,
                    child: Image(
                      height:MediaQuery.of(context).size.height*.9 ,
                      image: AssetImage('assets/images/car2.png')),
                  ),
                   Container(
                    alignment: Alignment(car2x,0),
                     //width: MediaQuery.of(context).size.width*.5,
                     //height:MediaQuery.of(context).size.height*.5 ,
                  child: Image(image: AssetImage('assets/images/car1.png')),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey,
                border: Border.all(color: Colors.grey, width: 5),
              ),
              child: Container(
                  padding: EdgeInsets.all(8),
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width,
                  //height: MediaQuery.of(context).size.height*.2,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.teal.shade900),
                  child: youWon == false && youLose == false? Text(
                    '${_questions[_questionIndex]['question']}',
                    style: TextStyle(color: Colors.white),
                  ):text
                  
                  ),
            ),
          ),
          Expanded(
            child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(color: Colors.pink.shade900),
                child:youWon == false && youLose == false? Row(
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
                                questionAnswered(answer['score'] == true);
                              },
                            )),
                  ],
                ):youWon == true?
                Center(
                  child: Text('You Won The Race',
                  style:TextStyle(
            color: Colors.white,
            fontSize: 40,
            fontWeight: FontWeight.bold
            ),
                  ),
                ):
                youLose == true?
Center(
                  child: Text('You Lose The Race',
                  style:TextStyle(
            color: Colors.white,
            fontSize: 40,
            fontWeight: FontWeight.bold
            ),
                  ),
                ):null
                )
          )
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
