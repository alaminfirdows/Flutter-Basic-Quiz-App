import 'package:flutter/material.dart';
import './quiz.dart';
import './result.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  final _questions = const [
    {
      'question': 'আমাদের দেশের নাম?',
      'correctAnswer': 2,
      'answers': [
        {'text': 'ঢাকা', 'value': 1},
        {'text': 'বাংলাদেশ', 'value': 2},
        {'text': 'ভারত', 'value': 3},
        {'text': 'নোয়াখালি', 'value': 4},
      ]
    },
    {
      'question': 'আমাদের জাতীয় ফুলের নাম?',
      'correctAnswer': 3,
      'answers': [
        {'text': 'গোলাপ', 'value': 1},
        {'text': 'জবা', 'value': 2},
        {'text': 'শাপলা', 'value': 3},
        {'text': 'শিউলি', 'value': 4},
      ]
    },
    {
      'question': 'আমাদের জাতীয় পশুর নাম?',
      'correctAnswer': 3,
      'answers': [
        {'text': 'গাধা', 'value': 1},
        {'text': 'ঘোড়া', 'value': 2},
        {'text': 'রয়েল বেঙ্গল টাইগার', 'value': 3},
        {'text': 'বিড়াল', 'value': 4},
      ]
    },
  ];

  var _questionIndex = 0;
  var _totalScore = 0;

  void _answerQuestion(int value) {
    if (this._questions[this._questionIndex]['correctAnswer'] == value) {
      _totalScore = _totalScore + 1;
    }

    setState(() {
      _questionIndex = _questionIndex + 1;
    });
  }

  void _restartQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('কুইজ'), actions: [
        RaisedButton(
          child: Text('হোম'),
          onPressed: _restartQuiz,
        ),
      ]),
      body: Column(
        children: [
          _questionIndex < _questions.length
              ? Quiz(
                  questions: _questions,
                  questionIndex: _questionIndex,
                  answerQuestion: _answerQuestion,
                )
              : Result(_totalScore, _restartQuiz),
        ],
      ),
    );
  }
}
