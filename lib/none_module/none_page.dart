import 'package:flutter/material.dart';
import 'package:lesson01/none_module/minus_button.dart';
import 'package:lesson01/none_module/plus_button.dart';

class NonePage extends StatefulWidget {
  const NonePage({Key? key}) : super(key: key);

  @override
  State<NonePage> createState() => _NonePageState();
}

class _NonePageState extends State<NonePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: Text("None Page"),
      actions: [
        IconButton(
          onPressed: () {
            setState(() {
              _counter--;
            });
          },
          icon: Icon(Icons.remove),
        ),
        IconButton(
          onPressed: () {
            setState(() {
              _counter++;
            });
          },
          icon: Icon(Icons.add),
        ),
      ],
    );
  }

  int _counter = 0;

  Widget _buildBody() {
    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(child: Center(child: Text("Counter: $_counter"))),
          _buildButtonBar(),
        ],
      ),
    );
  }

  Widget _buildButtonBar() {
    return Container(
      color: Colors.grey[300],
      padding: EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MinusButton(),
          PlusButton(),
        ],
      ),
    );
  }
}
