import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../logics/counter_logic.dart';
import '../logics/language_logic.dart';
import '../logics/theme_logic.dart';
import '../pages/cache_page.dart';

Widget cacheAppWithProvider() {
  return MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => CounterLogic()),
      ChangeNotifierProvider(create: (context) => ThemeLogic()),
      ChangeNotifierProvider(create: (context) => LanguageLogic()),
    ],
    child: CacheApp(),
  );
}

class CacheApp extends StatelessWidget {
  const CacheApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    int counter = context.watch<CounterLogic>().counter;

    ThemeMode mode = context.watch<ThemeLogic>().mode;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CachePage(),
      themeMode: mode,
      theme: ThemeData(
        canvasColor: Colors.white,
        primarySwatch: Colors.purple,
        textTheme: TextTheme(
          bodyText1: TextStyle(fontSize: 18),
          bodyText2: TextStyle(fontSize: 20 + counter.toDouble()),
        ),
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        canvasColor: Colors.black,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.blueGrey[800],
        ),
        textTheme: TextTheme(
          bodyText1: TextStyle(fontSize: 18),
          bodyText2: TextStyle(fontSize: 20 + counter.toDouble()),
        ),
      ),
    );
  }
}
