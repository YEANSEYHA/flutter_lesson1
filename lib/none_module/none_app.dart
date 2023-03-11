import 'package:flutter/material.dart';
import 'package:lesson01/none_module/none_page.dart';

class NoneApp extends StatelessWidget {
  const NoneApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: NonePage(),
      theme: ThemeData(
        textTheme: TextTheme(
          bodyText2: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
