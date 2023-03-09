import 'package:flutter/material.dart';

import './main.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final Function resetHandler;

  Result(this.resultScore, this.resetHandler);

  String get resultPhrase {
    var resultText;
    if (resultScore <= 10) {
      resultText = 'You are awesome and innocent!';
    } else if (resultScore <= 20) {
      resultText = 'You are strange!';
    }

    return resultText;
  }

  String get outputScore {
    var scoreText = 'Your Score is: ' + resultScore.toString();
    return scoreText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            resultPhrase,
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          Text(
            outputScore,
            style: TextStyle(fontSize: 24),
          ),
          OutlinedButton(
            onPressed: resetHandler,
            child: Text('Restart Quiz'),
          ),
        ],
      ),
    );
  }
}
