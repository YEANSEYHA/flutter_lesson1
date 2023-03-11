import 'package:flutter/material.dart';

class PlusButton extends StatefulWidget {
  const PlusButton({Key? key}) : super(key: key);

  @override
  State<PlusButton> createState() => _PlusButtonState();
}

class _PlusButtonState extends State<PlusButton> {

  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.cyanAccent,
      child: Column(
        children: [
          IconButton(
            onPressed: () {
              setState(() {
                _counter++;
              });
            },
            icon: Icon(Icons.add),
          ),
          Text("In Plus Button: $_counter"),
        ],
      ),
    );
  }
}
