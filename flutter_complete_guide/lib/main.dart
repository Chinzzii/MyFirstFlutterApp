import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;
  var _totalScore = 0;

  void _answerQuestion(int score) {
    _totalScore += score;
    setState(() {
      _questionIndex++;
    });
    print(_questionIndex);
  }

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    var _questions = [
      {
        'questionText': '0. What\'s your favourite color',
        'answer': [
          {'text': 'Red', 'score': 5},
          {'text': 'Blue', 'score': 3},
          {'text': 'Black', 'score': 10},
          {'text': 'White', 'score': 1},
        ],
      },
      {
        'questionText': '1. What\'s your favourite animal',
        'answer': [
          {'text': 'Rabbit', 'score': 3},
          {'text': 'Snake', 'score': 1},
          {'text': 'Elephant', 'score': 5},
          {'text': 'Lion', 'score': 10},
        ],
      },
    ];

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(_answerQuestion, _questions, _questionIndex)
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
