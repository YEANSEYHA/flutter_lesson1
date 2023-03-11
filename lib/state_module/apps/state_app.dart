import 'package:flutter/material.dart';
import 'package:lesson01/state_module/logics/counter_logic.dart';
import 'package:lesson01/state_module/logics/theme_logic.dart';
import 'package:lesson01/state_module/pages/state_page.dart';
import 'package:provider/provider.dart';

Widget appWithProvider() {
  return MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => CounterLogic()),
      ChangeNotifierProvider(create: (context) => ThemeLogic()),
    ],
    child: StateApp(),
  );
}

class StateApp extends StatelessWidget {
  const StateApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int counter = context.watch<CounterLogic>().counter;

    ThemeMode mode = context.watch<ThemeLogic>().mode;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StatePage(),
      themeMode: mode,
      theme: ThemeData(
        canvasColor: Colors.pink[50],
        primarySwatch: Colors.pink,
        textTheme: TextTheme(
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
          bodyText2: TextStyle(fontSize: 20 + counter.toDouble()),
        ),
      ),
    );
  }
}
