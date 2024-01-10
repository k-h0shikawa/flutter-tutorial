import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  // debugPaintSizeEnabled = true;
  runApp(MaterialApp(
    home: MainPage(),
  ));
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;
  final _pageWidgets = [
    const PageWidget(color: Colors.white, title: 'Home'),
    const PageWidget(color: Colors.blue, title: 'Album'),
    const PageWidget(color: Colors.orange, title: 'Project')
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BottomNavigationBar'),
      ),
      body: _pageWidgets.elementAt(_currentIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'HOME'),
          BottomNavigationBarItem(
              icon: Icon(Icons.photo_album), label: 'Album'),
          BottomNavigationBarItem(
              icon: Icon(Icons.edit_square), label: 'Project'),
        ],
        currentIndex: _currentIndex,
        fixedColor: Colors.blueAccent,
        onTap: onItemTapped,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }

  void onItemTapped(int index) => setState(() => _currentIndex = index);
}

class PageWidget extends StatelessWidget {
  final Color color;
  final String title;

  const PageWidget({Key? key, required this.color, required this.title})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      child: Center(
          child: Text(
        title,
        style: TextStyle(fontSize: 25),
      )),
    );
  }
}
