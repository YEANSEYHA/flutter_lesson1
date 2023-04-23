import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../logics/counter_logic.dart';

class MinusButtonWidget extends StatelessWidget {
  const MinusButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    int count = context.watch<CounterLogic>().counter;

    return Container(
      color: Colors.limeAccent,
      child: Column(
        children: [
          IconButton(
            onPressed: () {
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
