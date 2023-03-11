import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../logics/counter_logic.dart';

class PlusButtonWidget extends StatefulWidget {
  const PlusButtonWidget({Key? key}) : super(key: key);

  @override
  State<PlusButtonWidget> createState() => _PlusButtonWidgetState();
}

class _PlusButtonWidgetState extends State<PlusButtonWidget> {
  @override
  Widget build(BuildContext context) {
    int counter = context.watch<CounterLogic>().counter;

    return Container(
      color: Colors.orange,
      child: Column(
        children: [
          IconButton(
            onPressed: () {
              // setState(() {
              //   _counter++;
              // });
              context.read<CounterLogic>().decrease();
            },
            icon: Icon(Icons.add),
          ),
          Text("In Plus Button: $counter"),
        ],
      ),
    );
  }
}
