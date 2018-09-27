import 'package:flutter/material.dart';
import 'package:trivia_flutter_demo/model/question.dart';

class MainBody extends StatefulWidget {
  MainBody({Key key, @required this.question, this.title}) : super(key: key);
  final String title;
  final Question question;

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
          children: <Widget>[Text(widget.question.question)],
        ),
        Container(
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(widget.question.answersList[0].text),
                  Text(widget.question.answersList[1].text),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(widget.question.answersList[2].text),
                  Text(widget.question.answersList[3].text),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
