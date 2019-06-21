import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreen createState() => _SearchScreen();
}

class _SearchScreen extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(centerTitle: true, title: Text('Movies')),
      body: TextField(
          decoration: InputDecoration(
              labelText: "Search",
              hintText: "input a movie to search...",
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15.0))))));
}
