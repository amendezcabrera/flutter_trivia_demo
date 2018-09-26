import 'package:meta/meta.dart';
import 'package:trivia_flutter_demo/model/answer.dart';

class Question{
  String category;
  String difficulty;
  List<Answer> answersList;

  Question({@required this.category, @required this.difficulty, @required this.answersList});
}