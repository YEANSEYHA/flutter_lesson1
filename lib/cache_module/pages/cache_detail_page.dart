import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants/language_constant.dart';
import '../logics/counter_logic.dart';
import '../logics/language_logic.dart';

class CacheDetailPage extends StatefulWidget {
  const CacheDetailPage({Key? key}) : super(key: key);

  @override
  State<CacheDetailPage> createState() => _CacheDetailPageState();
}

class _CacheDetailPageState extends State<CacheDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  AppBar _buildAppBar() {
    Language lang = context.watch<LanguageLogic>().lang;
    return AppBar(
      title: Text(lang.detailPageName),
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
