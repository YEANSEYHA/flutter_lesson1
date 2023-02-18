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
      theme: ThemeData(
        canvasColor: Colors.black,
        textTheme: TextTheme(
          bodyText2: TextStyle(color: Colors.white, fontSize: 20),
        ),
        appBarTheme: AppBarTheme(
          color: Color(0xFF002255),
          centerTitle: true,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ),
          ),
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            backgroundColor: Colors.grey[900],
            foregroundColor: Colors.pink,
            side: BorderSide(color: Colors.grey.withOpacity(0.5)),
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(horizontal: 10),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            backgroundColor: Colors.pink,
            foregroundColor: Colors.white,
          ),
        ),
      ),
    );
  }
}
