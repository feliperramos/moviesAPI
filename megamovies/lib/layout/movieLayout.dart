import 'package:flutter/material.dart';
import '../model/movie.dart';

class MovieTile extends StatelessWidget {
  final Movies _movies;
  MovieTile(this._movies);

  @override
  Widget build(BuildContext context) => Column(
        children: <Widget>[
          Container(
            child: TextField(
            decoration: InputDecoration(
                labelText: "Search",
                hintText: "input a movie to search...",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(25.0)))),
          )),
          ListTile(
            title: Text(_movies.year),
            subtitle: Text(_movies.movies),
            leading: Container(margin: EdgeInsets.only(left: 5.0)),
          ),
          Divider()
        ],
      );
}
