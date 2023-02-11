import 'package:flutter/material.dart';
import 'package:lesson01/basic_module/gridview_page.dart';

class BasicApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: GridViewPage(),
    );
  }
}
