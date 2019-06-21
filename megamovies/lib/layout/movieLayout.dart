import 'package:flutter/material.dart';
import '../model/movie.dart';

class MovieTile extends StatelessWidget {
  final Movies _movies;
  MovieTile(this._movies);

  @override
  Widget build(BuildContext context) => Column(
        children: <Widget>[
          ListTile(
            title: Text(_movies.year),
            subtitle: Text(_movies.movies),
            leading: Container(
              margin: EdgeInsets.only(left: 5.0),
              child: Text("Teste"),
            ),
          ),
          Divider()
        ],
      );
}
