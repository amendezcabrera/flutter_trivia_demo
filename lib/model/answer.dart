import 'package:meta/meta.dart';

class Answer{
  String text;
  bool correct;

  Answer({@required this.text, @required this.correct});

  @override
  String toString() {
    return 'Answer{text: $text, correct: ${correct ? 'Yes' : 'No'}';
  }
}