import 'package:flutter/material.dart';
import 'package:lesson01/state_module/logics/counter_logic.dart';
import 'package:provider/provider.dart';

class StateDetailPage extends StatefulWidget {
  const StateDetailPage({Key? key}) : super(key: key);

  @override
  State<StateDetailPage> createState() => _StateDetailPageState();
}

class _StateDetailPageState extends State<StateDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: Text("State Detail Page"),
    );
  }

  Widget _buildBody() {
    int cnt = context.watch<CounterLogic>().counter;

    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {
                  context.read<CounterLogic>().decrease();
                },
                icon: Icon(Icons.remove),
              ),
              IconButton(
                onPressed: () {
                  context.read<CounterLogic>().increase();
                },
                icon: Icon(Icons.add),
              )
            ],
          ),
          Expanded(child: Center(child: Text("Counter: $cnt"))),
        ],
      ),
    );
  }
}
