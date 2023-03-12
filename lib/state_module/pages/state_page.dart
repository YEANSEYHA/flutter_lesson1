import 'package:flutter/material.dart';
import 'package:lesson01/state_module/constants/language_constant.dart';
import 'package:lesson01/state_module/logics/counter_logic.dart';
import 'package:lesson01/state_module/logics/language_logic.dart';
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
    Language lang = context.watch<LanguageLogic>().lang;

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
            title: Text(lang.home),
          ),
          ListTile(
            leading: Icon(Icons.phone),
            title: Text(lang.contact),
          ),
          ExpansionTile(
            title: Text(lang.theme),
            initiallyExpanded: true,
            children: [
              ListTile(
                leading: Icon(Icons.dark_mode),
                title: Text(lang.changeToDark),
                trailing: Icon(mode == ThemeMode.dark
                    ? Icons.check_box_rounded
                    : Icons.check_box_outline_blank),
                onTap: () {
                  context.read<ThemeLogic>().changeToDark();
                },
              ),
              ListTile(
                leading: Icon(Icons.light_mode),
                title: Text(lang.changeToLight),
                trailing: Icon(mode == ThemeMode.light
                    ? Icons.check_box_rounded
                    : Icons.check_box_outline_blank),
                onTap: () {
                  context.read<ThemeLogic>().changeToLight();
                },
              ),
              ListTile(
                leading: Icon(Icons.phone_android),
                title: Text(lang.changeToSystem),
                trailing: Icon(mode == ThemeMode.system
                    ? Icons.check_box_rounded
                    : Icons.check_box_outline_blank),
                onTap: () {
                  context.read<ThemeLogic>().changeToSystem();
                },
              ),
            ],
          ),
          ExpansionTile(
            title: Text(lang.language),
            initiallyExpanded: true,
            children: [
              ListTile(
                leading: Text("EN"),
                title: Text(lang.changeToEnglish),
                trailing: Icon(lang == languageList[0]
                    ? Icons.check_box_rounded
                    : Icons.check_box_outline_blank),
                onTap: () {
                  context.read<LanguageLogic>().changeToEnglish();
                },
              ),
              ListTile(
                leading: Text("ខ្មែរ"),
                title: Text(lang.changeToKhmer),
                trailing: Icon(lang == languageList[1]
                    ? Icons.check_box_rounded
                    : Icons.check_box_outline_blank),
                onTap: () {
                  context.read<LanguageLogic>().changeToKhmer();
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  AppBar _buildAppBar() {
    Language lang = context.watch<LanguageLogic>().lang;

    return AppBar(
      title: Text(lang.homePageName),
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
