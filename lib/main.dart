import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() {
  // debugPaintSizeEnabled = true;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'column and row',
        home: Container(
          child: Center(
            child: Row(
                // 位置情報を指定
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(color: Colors.blue, width: 100, height: 100),
                  Container(color: Colors.red, width: 100, height: 100),
                ]),
          ),
        ));
  }
}
