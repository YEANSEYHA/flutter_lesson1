import 'package:flutter/material.dart';
import 'package:lesson01/localhost_module/logics/product_logic.dart';
import 'package:lesson01/localhost_module/pages/localhost_splash_page.dart';
import 'package:provider/provider.dart';

Widget localhostWithProvider() {
  return MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => ProductLogic()),
    ],
    child: LocalhostApp(),
  );
}

class LocalhostApp extends StatelessWidget {
  const LocalhostApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LocalhostSplashPage(),
      // theme: ThemeData(
      //   textTheme: TextTheme(
      //     bodyText2: TextStyle(fontSize: 20),
      //   ),
      // ),
    );
  }
}
