import 'package:flutter/material.dart';
import '../layout/movieLayout.dart';
import '../model/movie.dart';
import '../repository/movieRepo.dart';

class AppHome extends StatefulWidget {
  @override
  _AppHomeState createState() => _AppHomeState();
}

class _AppHomeState extends State<AppHome> {
  List<Movies> _movies = <Movies>[];

  @override
  void initState() {
    super.initState();
    listenMovies();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(centerTitle: true, title: Text('Movies')),
      body: Container(
          child: ListView.builder(
              itemCount: _movies.length,
              itemBuilder: (context, index) => MovieTile(_movies[index]))),
      bottomNavigationBar: Container(
        child: TextField(
            decoration: InputDecoration(
                labelText: "Search",
                hintText: "input a movie to search...",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15.0))))),
      ));

  void listenMovies() async {
    final Stream<Movies> stream = await getMovies();
    stream.listen((Movies movie) => setState(() => _movies.add(movie)));
  }
}
