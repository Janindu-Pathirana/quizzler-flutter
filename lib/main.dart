import 'package:flutter/material.dart';

import 'package:quizzler/brain.dart';

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

Brain brain = Brain();

int questionNum = 0;

Text showQuestion() {
  var text = "...END...";
  if (questionNum < brain.questionLength()) {
    text = brain.questions(questionNum).question;
  }
  return Text(
    text,
    textAlign: TextAlign.center,
    style: TextStyle(
      fontSize: 25.0,
      color: Colors.white,
    ),
  );
}

class End extends StatefulWidget {
  const End({Key key}) : super(key: key);

  @override
  _EndState createState() => _EndState();
}

class _EndState extends State<End> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: EndBody(),
        ),
      ),
    );
  }
}

class EndBody extends StatefulWidget {
  const EndBody({Key key}) : super(key: key);

  @override
  _EndBodyState createState() => _EndBodyState();
}

class _EndBodyState extends State<EndBody> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: Text("End"),
        ),
        TextButton(child: Text("Try again"))
      ],
    );
  }
}

void addIcon(bool ans) {
  if (questionNum < brain.questionLength()) {
    if (brain.questions(questionNum).answer == ans) {
      score.add(
        Icon(
          Icons.check,
          color: Colors.green,
        ),
      );
    } else {
      score.add(
        Icon(
          Icons.close,
          color: Colors.red,
        ),
      );
    }

    questionNum++;
  }
}

List<Widget> score = [];

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: showQuestion(),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: TextButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.green)),
              child: Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                setState(() {
                  addIcon(true);
                });
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: TextButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.red)),
              child: Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                setState(() {
                  addIcon(false);
                });
              },
            ),
          ),
        ),
        Row(children: score),
        //TODO: Add a Row here as your score keeper
      ],
    );
  }
}

/*
question1: 'You can lead a cow down stairs but not up stairs.', false,
question2: 'Approximately one quarter of human bones are in the feet.', true,
question3: 'A slug\'s blood is green.', true,
*/
