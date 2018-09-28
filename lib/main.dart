import 'package:flutter/material.dart';
import 'package:trivia_flutter_demo/model/question.dart';
import 'package:trivia_flutter_demo/repository.dart';
import 'package:trivia_flutter_demo/widget/main_body.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Open Trivia',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(title: 'Open Trivia'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: null,
      body: _newQuestion(),
      floatingActionButton: new FloatingActionButton(
        onPressed: () {
          setState(() {
            _newQuestion();
          });
        },
        tooltip: 'Next question',
        child: new Icon(Icons.skip_next),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
  }

  Widget _newQuestion() {
    return FutureBuilder(
        future: Repository.get().fetchQuestion(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          Question question = snapshot.data;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Center(
                      child: MainBody(
                        question: question,
                        onQuestionAnswered: () {
                          setState(() {
                            _newQuestion();
                          });
                        },
                      ),
                    ),
                  ],
                ),
              )
            ],
          );
        });
  }
}
