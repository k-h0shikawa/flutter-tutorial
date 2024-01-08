import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

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
  String _text = '';

  void _hadleText(String e) {
    setState(() {
      _text = e;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(50.0),
      child: Column(children: <Widget>[
        Text(
          "$_text",
          style: TextStyle(
              color: Colors.blueAccent,
              fontSize: 30.0,
              fontWeight: FontWeight.w500),
        ),
        new TextField(
          enabled: true,
          maxLength: 10,
          maxLengthEnforcement: MaxLengthEnforcement.none,
          style: TextStyle(color: Colors.black),
          obscureText: false,
          // maxLines: 1,
          onChanged: _hadleText,
          keyboardType: TextInputType.multiline,
          maxLines: null,
        )
      ]),
    );
  }
}
