import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'searchPage.dart';
import 'chatsPage.dart';

bool getCurrentUser() {
  return true;
}

Route createRouteHomePage() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => const HomePage(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0.0, 1.0);
      const end = Offset.zero;
      const curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  int _nBarIndex = 1;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Search(),
    Text(
      'Home',
      style: optionStyle,
    ),
    Chats()
  ];

  void _onTtemTap(int index) {
    setState(() {
      _nBarIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(title: const Text('MyCoolApp')),
      backgroundColor: Colors.blue[200],
      body: Center(
        child: _widgetOptions.elementAt(_nBarIndex),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        items: const [
          Icon(Icons.search),
          Icon(Icons.home),
          Icon(Icons.chat),
        ],
        buttonBackgroundColor: Colors.white,
        index: _nBarIndex,
        onTap: _onTtemTap,
        backgroundColor: Colors.blue.shade200,
      ),
    );
  }
}
