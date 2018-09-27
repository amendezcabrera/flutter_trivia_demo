import 'package:flutter/material.dart';
import 'package:trivia_flutter_demo/model/question.dart';
import 'package:trivia_flutter_demo/repository.dart';
import 'package:trivia_flutter_demo/widget/main_body.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(title: 'Flutter Demo Home Page'),
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
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: FutureBuilder(
          future: Repository.get().fetchQuestion(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            Question question = snapshot.data;
            return MainBody(question: question,);
          }),
      floatingActionButton: new FloatingActionButton(
        tooltip: 'Increment',
        child: new Icon(Icons.skip_next),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
  }
}
