import 'package:flutter/material.dart';
import 'package:lesson01/localhost_module/logics/product_logic.dart';
import 'package:lesson01/localhost_module/pages/product_page.dart';
import 'package:provider/provider.dart';

class LocalhostSplashPage extends StatefulWidget {
  const LocalhostSplashPage({Key? key}) : super(key: key);

  @override
  State<LocalhostSplashPage> createState() => _LocalhostSplashPageState();
}

class _LocalhostSplashPageState extends State<LocalhostSplashPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 1), () async {
      await context.read<ProductLogic>().read();
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => ProductPage(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Icon(Icons.shopping_cart, size: 100)),
          Text("Loading..."),
          // CircularProgressIndicator(),
        ],
      ),
    );
  }
}
