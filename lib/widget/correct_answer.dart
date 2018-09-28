import 'package:flutter/material.dart';

class CorrectAnswer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.greenAccent),
      child: Center(
        child: SizedBox(
          height: 600.0,
          width: double.maxFinite,
          child: SimpleDialog(
            children: <Widget>[
              Icon(
                Icons.check,
                size: 150.0,
                color: Colors.greenAccent,
              ),
              Text(
                'Yeahhhhh!!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
