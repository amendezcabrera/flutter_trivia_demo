import 'package:flutter/material.dart';
import 'package:trivia_flutter_demo/model/answer.dart';

class AnswerContainer extends StatefulWidget {
  AnswerContainer(
      {Key key, @required this.answer, @required this.color, this.title})
      : super(key: key);
  final String title;
  final Answer answer;
  final Color color;

  @override
  _AnswerContainerState createState() => new _AnswerContainerState();
}

class _AnswerContainerState extends State<AnswerContainer> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTapUp: (tapUpDetails){
          print('Correct? ${widget.answer.correct ? 'Yes' : 'No'}');
        },
        child: Container(
          color: widget.color,
          child: SizedBox(
            width: double.maxFinite,
            height: 60.0,
            child: Center(
              child: Text(
                widget.answer.text,
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
