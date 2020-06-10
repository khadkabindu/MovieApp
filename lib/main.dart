import 'package:flutter/material.dart';
import 'package:flutter_project/account_screen.dart';
import 'package:flutter_project/home.dart';
import 'package:flutter_project/movie_screen.dart';
import 'package:flutter_project/search_screen.dart';
import 'package:flutter_project/tvShow_screen.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => FirstPage(),

    },
  ));
}

class FirstPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  int _currentIndex = 0;
  final tabs = [
    HomePage(),
    SearchScreen(),
    MovieScreen(),
    TvShow(),
    AccountScreen(),

  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            title: Text('Search'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.movie),
            title: Text('Movie'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.tv),
            title: Text('Tv Show'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: Text('Account'),
          ),
        ],
        currentIndex: _currentIndex,
        selectedItemColor: Colors.red,
        onTap: (index){
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );


  }
}
