import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';
// void main() {
//   runApp(MyApp());
// }

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': 'How many litres of water do you drink per day?',
      'answers': [
        {'text': 'Half', 'score': 10},
        {'text': 'One ', 'score': 5},
        {'text': 'One and half', 'score': 3},
        {'text': 'Two', 'score': 1},
      ],
    },
    {
      'questionText': 'How often do you have raw carrot?',
      'answers': [
        {'text': 'Everyday', 'score': 3},
        {'text': 'Never', 'score': 11},
        {'text': 'twice a week', 'score': 5},
        {'text': 'twice a month', 'score': 9},
      ],
    },
    {
      'questionText': 'How many hours do you sleep?',
      'answers': [
        {'text': 'Eight', 'score': 1},
        {'text': 'six', 'score': 2},
        {'text': 'four', 'score': 3},
        {'text': 'two', 'score': 4},
      ],
    },
  ];
  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    // var aBool = true;
    // aBool = false;

    _totalScore += score;

    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
    if (_questionIndex < _questions.length) {
      print('We have more questions!');
    } else {
      print('No more questions!');
    }
  }

  @override
  Widget build(BuildContext context) {
    // var dummy = const ['Hello'];
    // dummy.add('Max');
    // print(dummy);
    // dummy = [];
    // questions = []; // does not work if questions is a const

    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 233, 183, 109),
        
        appBar: AppBar(
          title: Text('FITNESS CHECK'),
        ),
        body: _questionIndex < _questions.length
            
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}