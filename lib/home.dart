import 'package:flutter/material.dart';

import 'movie_list.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomePage();
  }
}

class _HomePage extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: ListView(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(10.0),
                    child: Row(
                      children: <Widget>[
                        Text('Now Playing'),
                        SizedBox(
                          width: 260,
                        ),
                        IconButton(
                          icon: Icon(Icons.arrow_forward),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                  MovieListPage('now_playing'),
                  Container(
                    padding: EdgeInsets.all(10.0),
                    child: Row(
                      children: <Widget>[
                        Text('Upcoming'),
                        SizedBox(
                          width: 260,
                        ),
                        IconButton(
                          icon: Icon(Icons.arrow_forward),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                  MovieListPage('upcoming'),
                  Container(
                    padding: EdgeInsets.all(10.0),
                    child: Row(
                      children: <Widget>[
                        Text('Popular'),
                        SizedBox(
                          width: 260,
                        ),
                        IconButton(
                          icon: Icon(Icons.arrow_forward),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                  MovieListPage('popular'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}