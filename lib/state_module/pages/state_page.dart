import 'package:flutter/material.dart';
import 'package:lesson01/state_module/logics/counter_logic.dart';
import 'package:lesson01/state_module/logics/theme_logic.dart';
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
      drawer: _buildDrawer(),
    );
  }

  Widget _buildDrawer() {
    ThemeMode mode = context.watch<ThemeLogic>().mode;

    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
              child: Icon(
            Icons.face,
            size: 100,
          )),
          ListTile(
            leading: Icon(Icons.home),
            title: Text("Home"),
          ),
          ListTile(
            leading: Icon(Icons.phone),
            title: Text("Contact"),
          ),
          ExpansionTile(
            title: Text("Theme"),
            initiallyExpanded: true,
            children: [
              ListTile(
                leading: Icon(Icons.dark_mode),
                title: Text("Change To Dark"),
                trailing: Icon(mode == ThemeMode.dark
                    ? Icons.check_box_rounded
                    : Icons.check_box_outline_blank),
                onTap: () {
                  context.read<ThemeLogic>().changeToDark();
                },
              ),
              ListTile(
                leading: Icon(Icons.light_mode),
                title: Text("Change To Light"),
                trailing: Icon(mode == ThemeMode.light
                    ? Icons.check_box_rounded
                    : Icons.check_box_outline_blank),
                onTap: () {
                  context.read<ThemeLogic>().changeToLight();
                },
              ),
              ListTile(
                leading: Icon(Icons.phone_android),
                title: Text("Change To System"),
                trailing: Icon(mode == ThemeMode.system
                    ? Icons.check_box_rounded
                    : Icons.check_box_outline_blank),
                onTap: () {
                  context.read<ThemeLogic>().changeToSystem();
                },
              ),
            ],
          ),
        ],
      ),
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
            context.read<CounterLogic>().decrease();
          },
          icon: Icon(Icons.remove),
        ),
        IconButton(
          onPressed: () {
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
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.all(10),
                child: Text(
                    "Few watching the six-week trial of convicted doubler murderer Alex Murdaugh were unmoved by the extraordinary and highly personal 15-minute admonishment that presiding Judge Clifton B. Newman gave the once prominent lawyer before sentencing him to life in prison Friday.For many South Carolina residents, the optics of watching Newman, 71, who is African American and grew up going to the state’s segregated schools, rule with such finality over the fate of the scion of one of the most powerful legal families in the state was astonishing."),
              ),
            ),
          ),
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
