import 'package:meta/meta.dart';
import 'package:html/parser.dart';

class Answer{
  String text;
  bool correct;

  Answer({@required text, @required this.correct}){
    this.text = parse(text).firstChild.text;
  }

  @override
  String toString() {
    return 'Answer{text: $text, correct: ${correct ? 'Yes' : 'No'}';
  }
}