import 'package:flutter/material.dart';

class Answer extends StatelessWidget {

  final String answerText;
  final Color answerColor;
  final VoidCallback answerTap;
  const Answer({ Key? key, 
  required this.answerText, 
  required this.answerColor, 
  required this.answerTap,
   }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
                      child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: answerColor,
                            ),
                        onPressed:answerTap,
                        child: Text(answerText)),
                  ));
  }
}