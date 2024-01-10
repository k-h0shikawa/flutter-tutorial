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

  DateTime _date = DateTime.now();

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: _date,
        firstDate: DateTime(2016),
        lastDate: DateTime.now().add(const Duration(days: 360)));
    if (picked != null) setState(() => _date = picked);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(50.0),
      child: Column(
        children: <Widget>[
          Center(
            child: Text("${_date}"),
          ),
          ElevatedButton(
              onPressed: () => _selectDate(context), child: const Text('日付選択'))
        ],
      ),
    );
  }
}
