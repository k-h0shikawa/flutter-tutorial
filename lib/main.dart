import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp()); /*1*/

class MyApp extends StatelessWidget {
  /*2*/
  @override
  Widget build(BuildContext context) {
    /*3*/
    return MaterialApp(
      /*4*/
      title: 'Welcome to Flutter',
      home: Scaffold(
        /*5*/
        appBar: AppBar(
          /*6*/
          title: Text('Welcome to Flutter'),
        ),
        body: Center(
          /*7*/
          child: RandomWords(),
        ),
      ),
    );
  }
}

/*
 ジェネリクスにRandomWordsを指定することでRandomWordsの状態を維持できるようにする
*/
class RandomWordsState extends State<RandomWords> {
  @override
  Widget build(BuildContext context) {
    final wordPair = WordPair.random();
    return Text(wordPair.asPascalCase);
  }
}

class RandomWords extends StatefulWidget {
  @override
  RandomWordsState createState() => new RandomWordsState();
}
