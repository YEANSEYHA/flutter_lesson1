import 'package:flutter/material.dart';
import 'package:lesson01/multitask_modules/logics/post_logic.dart';
import 'package:lesson01/multitask_modules/logics/randomuser_logic.dart';
import 'package:lesson01/multitask_modules/pages/task_splash_page.dart';
import 'package:provider/provider.dart';

Widget taskWithProvider() {
  return MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => PostLogic()),
      ChangeNotifierProvider(create: (context) => RandomUserLogic()),
    ],
    child: TaskApp(),
  );
}

class TaskApp extends StatelessWidget {
  const TaskApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TaskSplashPage(),
      theme: ThemeData(
        textTheme: TextTheme(
          bodyText2: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
