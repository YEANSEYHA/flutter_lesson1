import 'package:flutter/material.dart';
import 'package:lesson01/cache_module/logics/counter_logic.dart';
import 'package:lesson01/cache_module/logics/language_logic.dart';
import 'package:lesson01/cache_module/logics/theme_logic.dart';
import 'package:provider/provider.dart';
import 'cache_page.dart';

class CacheLoadingPage extends StatefulWidget {
  const CacheLoadingPage({Key? key}) : super(key: key);

  @override
  State<CacheLoadingPage> createState() => _CacheLoadingPageState();
}

class _CacheLoadingPageState extends State<CacheLoadingPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      Duration(seconds: 1),
      () async {
        await context.read<LanguageLogic>().readCache();
        await context.read<CounterLogic>().readCache();
        await context.read<ThemeLogic>().readCache();
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => CachePage(),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.cached, size: 100),
            Text("Loading..."),
          ],
        ),
      ),
    );
  }
}
