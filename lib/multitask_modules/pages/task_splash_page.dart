import 'package:flutter/material.dart';
import 'package:lesson01/multitask_modules/logics/post_logic.dart';
import 'package:lesson01/multitask_modules/logics/randomuser_logic.dart';
import 'package:lesson01/multitask_modules/pages/multi_main_page.dart';
import 'package:provider/provider.dart';

class TaskSplashPage extends StatefulWidget {
  const TaskSplashPage({Key? key}) : super(key: key);

  @override
  State<TaskSplashPage> createState() => _TaskSplashPageState();
}

class _TaskSplashPageState extends State<TaskSplashPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 1), () async {
      await context.read<PostLogic>().read();
      await context.read<RandomUserLogic>().read();
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => MultiMainPage(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Icon(Icons.face, size: 100)),
          Text("Loading..."),
          // CircularProgressIndicator(),
        ],
      ),
    );
  }
}
