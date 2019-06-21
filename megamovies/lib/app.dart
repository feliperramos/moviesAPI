import 'package:flutter/material.dart';
import 'screens/appHome.dart';

class MovieListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
        title: "Movie List",
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primaryColor: Colors.black, accentColor: Colors.black),
        home: AppHome(),
      );
}
