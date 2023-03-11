import 'package:flutter/material.dart';

class MinusButton extends StatefulWidget {
  const MinusButton({Key? key}) : super(key: key);

  @override
  State<MinusButton> createState() => _MinusButtonState();
}

class _MinusButtonState extends State<MinusButton> {

  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.lightGreenAccent,
      child: Column(
        children: [
          IconButton(
            onPressed: () {
              setState(() {
                _counter--;
              });
            },
            icon: Icon(Icons.remove),
          ),
          Text("In Minus Button: $_counter"),
        ],
      ),
    );
  }
}
