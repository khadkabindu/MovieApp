import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<List<Movie>> fetchPhotos(http.Client client) async {
  final response = await client.get(
      'https://api.themoviedb.org/3/movie/popular?api_key=3d9f6ef05faa3072ee2caf7fb6870964');
  return compute(parsePhotos, response.body);
}

List<Movie> parsePhotos(String responseBody) {
  final Map<String, dynamic> response = json.decode(responseBody);
  List<dynamic> results = response['results'];
  return results.map((e) => Movie.fromJson(e as Map<String, dynamic>)).toList();
}

class Movie {
  final double popularity;
  final bool video;
  final String poster_path;
  final int id;
  final bool adult;
  final String backdrop_path;
  final String original_language;
  final String original_title;
  final String title;
  final String overview;
  final String release_date;

  Movie(
      {this.popularity,
      this.video,
      this.poster_path,
      this.id,
      this.adult,
      this.backdrop_path,
      this.original_language,
      this.original_title,
      this.title,
      this.overview,
      this.release_date});

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
        popularity: json['popularity'] as double,
        video: json['video'] as bool,
        poster_path: json['poster_path'] as String,
        id: json['id'] as int,
        adult: json['adult'] as bool,
        backdrop_path: json['backdrop_path'] as String,
        original_language: json['original_language'] as String,
        original_title: json['original_title'] as String,
        title: json['title'] as String,
        overview: json['overview'] as String,
        release_date: json['release_date'] as String);
  }
}

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTitle = 'Movie demo';

    return MaterialApp(
      title: appTitle,
      home: MyHomePage(title: appTitle),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;

  MyHomePage({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<Movie>>(
        future: fetchPhotos(http.Client()),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);

          return snapshot.hasData
              ? PhotosList(photos: snapshot.data)
              : Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}

class PhotosList extends StatelessWidget {
  final List<Movie> photos;

  PhotosList({Key key, this.photos}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: photos.length,
        itemBuilder: (context, index) {
          return Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(5.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Image.network(
                    "https://image.tmdb.org/t/p/w500" +
                        photos[index].poster_path,
                    height: 150,
                  ),
                ),
              ),
              Container(
                width: 100.0,
                child: Text(
                  photos[index].title,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
