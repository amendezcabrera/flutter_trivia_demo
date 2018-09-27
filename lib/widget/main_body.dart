import 'package:flutter/material.dart';
import 'package:trivia_flutter_demo/model/question.dart';
import 'package:trivia_flutter_demo/widget/asnwer_container.dart';
import 'package:trivia_flutter_demo/widget/question_container.dart';

class MainBody extends StatefulWidget {
  MainBody({Key key, @required this.question, this.onQuestionAnswered, this.title}) : super(key: key);
  final String title;
  final Question question;
  final OnQuestionAnsweredCallback onQuestionAnswered;

  @override
  _BodyState createState() => new _BodyState();
}

class _BodyState extends State<MainBody> {
  @override
  Widget build(BuildContext context) {
    return new Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            QuestionContainer(question: widget.question.question),
          ],
        ),
        Container(
          child: Column(
              children: widget.question.answersList.map((questionAnswer) {
            MaterialAccentColor color = Colors.greenAccent;
            if (widget.question.difficulty == 'medium') {
              color = Colors.orangeAccent;
            } else if (widget.question.difficulty == 'hard') {
              color = Colors.redAccent;
            }
            return GestureDetector(
              onTapDown: (tapDownDetails) {
                widget.onQuestionAnswered();
                print('Correct? ${questionAnswer.correct ? 'Yes' : 'No'}');
              },
              child: AnswerContainer(
                answer: questionAnswer,
                color: color,
              ),
            );
          }).toList()),
        ),
      ],
    );
  }
}

typedef OnQuestionAnsweredCallback = void Function();