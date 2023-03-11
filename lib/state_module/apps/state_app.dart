import 'package:flutter/material.dart';
import 'package:lesson01/state_module/logics/counter_logic.dart';
import 'package:lesson01/state_module/pages/state_page.dart';
import 'package:provider/provider.dart';

Widget appWithProvider() {
  return MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => CounterLogic()),
    ],
    child: StateApp(),
  );
}

class StateApp extends StatelessWidget {
  const StateApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StatePage(),
      theme: ThemeData(
        primarySwatch: Colors.pink,
        textTheme: TextTheme(
          bodyText2: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
