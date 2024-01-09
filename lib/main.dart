import 'package:flutter/material.dart';
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
            title: const Text('Form'),
          ),
          body: const Center(child: ChangeForm()),
        ));
  }
}

class ChangeForm extends StatefulWidget {
  const ChangeForm({super.key});

  @override
  State<ChangeForm> createState() => _ChangeFormState();
}

class _ChangeFormState extends State<ChangeForm> {
  final _formKey = GlobalKey<FormState>();

  String _name = '';
  String _email = '';

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Container(
        padding: const EdgeInsets.all(50.0),
        child: Column(
          children: <Widget>[
            TextFormField(
              enabled: true,
              maxLength: 10,
              maxLengthEnforcement: MaxLengthEnforcement.none,
              autovalidateMode: AutovalidateMode.disabled,
              obscureText: false,
              decoration: const InputDecoration(
                  hintText: 'お名前を教えてください', labelText: '名前*'),
              validator: (String? value) {
                return value!.isEmpty ? '必須入力です' : null;
              },
              onSaved: (String? value) {
                _name = value!;
              },
            ),
            TextFormField(
              maxLength: 100,
              autovalidateMode: AutovalidateMode.disabled,
              decoration: const InputDecoration(
                  hintText: '連絡先を教えてください', labelText: 'メールアドレス*'),
              validator: (String? value) {
                return !value!.contains('@') ? 'アットマークがありません' : null;
              },
              onSaved: (String? value) {
                _email = value!;
              },
            ),
            ElevatedButton(onPressed: _submission, child: Text('保存'))
          ],
        ),
      ),
    );
  }

  void _submission() {
    if (this._formKey.currentState?.validate() ?? false) {
      this._formKey.currentState?.save();
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Processing Data')));
      print(this._name);
      print(this._email);
    }
  }
}
