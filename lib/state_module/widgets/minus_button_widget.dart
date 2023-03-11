import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../logics/counter_logic.dart';

class MinusButtonWidget extends StatefulWidget {
  const MinusButtonWidget({Key? key}) : super(key: key);

  @override
  State<MinusButtonWidget> createState() => _MinusButtonWidgetState();
}

class _MinusButtonWidgetState extends State<MinusButtonWidget> {
  @override
  Widget build(BuildContext context) {
    int count = context.watch<CounterLogic>().counter;

    return Container(
      color: Colors.limeAccent,
      child: Column(
        children: [
          IconButton(
            onPressed: () {
              // setState(() {
              //   _counter--;
              // });
              context.read<CounterLogic>().decrease();
            },
            icon: Icon(Icons.remove),
          ),
          Text("In Minus Button: $count"),
        ],
      ),
    );
  }
}
