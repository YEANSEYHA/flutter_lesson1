import 'package:flutter/material.dart';
import 'package:lesson01/state_module/logics/counter_logic.dart';
import 'package:lesson01/state_module/pages/state_detail_page.dart';
import 'package:lesson01/state_module/widgets/minus_button_widget.dart';
import 'package:lesson01/state_module/widgets/plus_button_widget.dart';
import 'package:provider/provider.dart';

class StatePage extends StatefulWidget {
  const StatePage({Key? key}) : super(key: key);

  @override
  State<StatePage> createState() => _StatePageState();
}

class _StatePageState extends State<StatePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: Text("State Page"),
      actions: [
        IconButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => StateDetailPage(),
              ),
            );
          },
          icon: Icon(Icons.settings),
        ),
        IconButton(
          onPressed: () {
            // setState(() {
            //   _counter--;
            // });
            context.read<CounterLogic>().decrease();
          },
          icon: Icon(Icons.remove),
        ),
        IconButton(
          onPressed: () {
            // setState(() {
            //   _counter++;
            // });
            context.read<CounterLogic>().increase();
          },
          icon: Icon(Icons.add),
        ),
      ],
    );
  }

  Widget _buildBody() {
    int cnt = context.watch<CounterLogic>().counter;

    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(child: Center(child: Text("Counter: $cnt"))),
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
          MinusButtonWidget(),
          PlusButtonWidget(),
        ],
      ),
    );
  }
}
