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
        title: 'Form',
        home: Scaffold(
          appBar: AppBar(
            title: Text('Form'),
          ),
          body: Center(child: ChangeForm()),
        ));
  }
}

class ChangeForm extends StatefulWidget {
  const ChangeForm({super.key});

  @override
  State<ChangeForm> createState() => _ChangeFormState();
}

class _ChangeFormState extends State<ChangeForm> {
  int _count = 0;

  void _handlePressed() {
    setState(() {
      _count++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(50.0),
      child: Column(children: <Widget>[
        Text(
          "$_count",
          style: TextStyle(
              color: Colors.blueAccent,
              fontSize: 30.0,
              fontWeight: FontWeight.w500),
        ),
        TextButton(
          onPressed: _handlePressed,
          style: TextButton.styleFrom(
            backgroundColor: Colors.blue,
          ),
          child: Text(
            '更新',
            style: TextStyle(color: Colors.white, fontSize: 20.0),
          ),
        ),
      ]),
    );
  }
}
