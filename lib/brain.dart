import 'questions.dart';

class Brain {
  int _questionNum = 0;

  List<Questions> _questions = [
    Questions("10 x 10 = 100", true),
    Questions("9 x 10 = 90", true),
    Questions(
        "Sri Lanka's first president is MR. Chandika Kumarathunga", false),
    Questions("World's biggest mountain is Bambarakanda", false),
    Questions("Print('Hello World')", false),
    Questions("Mouse is a input device", true),
    Questions("You are the most stupid guy in this world", true),
    Questions("Can't build IOS apps using Flutter", false),
    Questions("Sri Lanka's biggest mountain is Piduruthalagala", true),
    Questions("Sri Lanka's longest river is Nilvala river", false)
  ];

  int get questionNum => _questionNum;

  void updateQuestionNum() {
    _questionNum++;
  }

  Questions questions(int number) => _questions[number];

  int questionLength() => _questions.length;
}
