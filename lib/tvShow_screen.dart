import 'package:flutter/material.dart';
class TvShow extends StatefulWidget {
  @override
  _TvShowState createState() => _TvShowState();
}

class _TvShowState extends State<TvShow> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(child: Text('Tv Shows'),),
      ),
    );
  }
}
