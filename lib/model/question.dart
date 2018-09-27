import 'package:html/parser.dart';
import 'package:meta/meta.dart';
import 'package:trivia_flutter_demo/helper/question_helper.dart';
import 'package:trivia_flutter_demo/model/answer.dart';

class Question {
  String category;
  String difficulty;
  String question;
  List<Answer> answersList;

  Question(
      {@required this.question,
      @required this.category,
      @required this.difficulty,
      @required this.answersList});

  Question.fromJson(Map<String, dynamic> json, List<Answer> receivedAnswersList)
      : question = parse(json[KEY_RESULTS][0][KEY_QUESTION]).firstChild.text,
        category = json[KEY_RESULTS][0][KEY_CATEGORY],
        difficulty = json[KEY_RESULTS][0][KEY_DIFFICULTY],
        answersList = receivedAnswersList;

  @override
  String toString() {
    return 'Question{category: $category, difficulty: $difficulty\n\tquestion: $question\n\tanswers: $answersList}';
  }
}
