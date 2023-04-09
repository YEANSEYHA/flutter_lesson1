import 'package:flutter/material.dart';
import 'package:lesson01/multitask_modules/pages/randomuser_page.dart';
import 'package:lesson01/multitask_modules/pages/task_page.dart';

class MultiMainPage extends StatefulWidget {
  const MultiMainPage({Key? key}) : super(key: key);

  @override
  State<MultiMainPage> createState() => _MultiMainPageState();
}

class _MultiMainPageState extends State<MultiMainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
      bottomNavigationBar: _buildBottom(),
    );
  }

  Widget _buildBody() {
    return IndexedStack(
      index: _currentIndex,
      children: [
        TaskPage(),
        RandomUserPage(),
      ],
    );
  }

  int _currentIndex = 0;

  Widget _buildBottom() {
    return BottomNavigationBar(
      backgroundColor: Colors.grey[300],
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.pink,
      currentIndex: _currentIndex,
      onTap: (index) {
        setState(() {
          _currentIndex = index;
        });
      },
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Post"),
        BottomNavigationBarItem(
            icon: Icon(Icons.account_circle), label: "User"),
      ],
    );
  }
}
