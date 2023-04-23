import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../logics/counter_logic.dart';

class PlusButtonWidget extends StatelessWidget {
  const PlusButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    int counter = context.watch<CounterLogic>().counter;

    return Container(
      color: Colors.orange,
      child: Column(
        children: [
          IconButton(
            onPressed: () {
              context.read<CounterLogic>().increase();
            },
            icon: Icon(Icons.add),
          ),
          Text("In Plus Button: $counter"),
        ],
      ),
    );
  }
}
