import 'package:flutter/material.dart';
import 'package:hayum/models/auth_model.dart';

class _BottomNavigationBarFactory {
  static BottomNavigationBar create(int _selectedIndex, ValueChanged<int> _onItemTapped) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(Icons.home), title: Container(height: 0.0)),
        BottomNavigationBarItem(icon: Icon(Icons.history), title: Container(height: 0.0)),
        BottomNavigationBarItem(icon: Icon(Icons.search), title: Container(height: 0.0)),
        BottomNavigationBarItem(icon: Icon(Icons.account_box), title: Container(height: 0.0)),
      ],
      currentIndex: _selectedIndex,
      fixedColor: Colors.green,
      onTap: _onItemTapped,
    );
  }
}

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key, this.title, this.auth}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;
  final Auth auth;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  final _widgetOptions = [
    Text('Index 0: Home'),
    Text('Index 2: Feed'),
    Text('Index 2: Search'),
    Text('Index 3: Profile'),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildProfile(widget.auth),
      bottomNavigationBar: _BottomNavigationBarFactory.create(_selectedIndex, _onItemTapped),
    );
  }

  Widget buildProfile(Auth auth) {
    return Center(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Text>[Text(auth.user.email), Text(auth.user.mobile)]));
  }
}
