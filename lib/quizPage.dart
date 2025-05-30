// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:quizzler/quiz_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

QuizBrain quizBrain = QuizBrain();

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> scoreKeeper = [];

  void checkAnswer(bool userPickedAnswer) {
    bool correctAnswer = quizBrain.getCorrectAnswer();

    setState(() {
      if (userPickedAnswer == correctAnswer) {
        scoreKeeper.add(
          Icon(
            Icons.check,
            color: Colors.green,
          ),
        );
      } else {
        scoreKeeper.add(Icon(Icons.close, color: Colors.red));
      }
      quizBrain.nextQuestion();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Center(
              child: Text(
                quizBrain.getQuestionTetx(),
                style: TextStyle(
                  fontSize: 28.0,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15),
            child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                onPressed: () {
                  checkAnswer(true);
                  if (quizBrain.isFinished() == true) {
                    Alert(
                        context: context,
                        title: "Quiz Finished",
                        desc: "You have reached the end of the quiz.",
                        buttons: [
                          DialogButton(
                            onPressed: () {
                              Navigator.pop(context);
                              quizBrain.reset();
                              setState(() {
                                scoreKeeper.clear();
                              });
                            },
                            child: Text(
                              "Restart Quiz",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                          )
                        ]).show();
                  }
                },
                child: Text(
                  'True',
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                )),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15),
            child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                onPressed: () {
                  checkAnswer(false);
                  if (quizBrain.isFinished() == true) {
                    Alert(
                        context: context,
                        title: "Quiz Finished",
                        desc: "You have reached the end of the quiz.",
                        buttons: [
                          DialogButton(
                            onPressed: () {
                              Navigator.pop(context);
                              quizBrain.reset();
                              setState(() {
                                scoreKeeper.clear();
                              });
                            },
                            child: Text(
                              "Restart Quiz",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                          )
                        ]).show();
                  }
                },
                child: Text(
                  'False',
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                )),
          ),
        ),

        //TODO: creating some score keeper
        Row(
          children: scoreKeeper,
        )
      ],
    );
  }
}
