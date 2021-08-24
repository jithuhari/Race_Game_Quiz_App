import 'package:flutter/material.dart';

class QuestionCard extends StatelessWidget {
  const QuestionCard({
    Key? key,
    required this.youWon,
    required this.youLose,
    required int questionIndex,
    required this.text,
  }) : _questionIndex = questionIndex, super(key: key);

  final bool youWon;
  final bool youLose;
  final int _questionIndex;
  final Text text;

  @override
  Widget build(BuildContext context) {
    return Expanded(
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
            child: youWon == false && youLose == false
                ? Text(
                    '${_questions[_questionIndex]['question']}',
                    style: TextStyle(color: Colors.white),
                  )
                : text),
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
