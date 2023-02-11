import 'package:flutter/material.dart';
import 'package:lesson01/movie_module/models/movie_model.dart';
import 'package:lesson01/movie_module/pages/movie_page.dart';

class MovieApp extends StatelessWidget {
  const MovieApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MoviePage(),
    );
  }
}
