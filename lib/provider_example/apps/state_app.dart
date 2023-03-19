import 'package:flutter/material.dart';
import 'package:lesson01/provider_example/apps/homepage.dart';
import 'package:lesson01/provider_example/logics/favorite_logic.dart';
import 'package:provider/provider.dart';

Widget appWithProviderExample() {
  return MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => FavoritesLogic()),
    ],
    child: ProviderExample(),
  );
}

class ProviderExample extends StatelessWidget {
  const ProviderExample({super.key});

  @override
  Widget build(BuildContext context) {
    String fruit = context.watch<FavoritesLogic>().fruit;
    return MaterialApp(
        title: 'Material App',
        home: Scaffold(
            appBar: AppBar(title: Text('Fruit is ' + fruit)),
            body: _buildColumn()));
  }

  Widget _buildColumn() {
    return Center(
      child: Column(
        children: [
          FruitButton(fruit: 'Apples'),
          FruitButton(fruit: 'Oranges'),
          FruitButton(fruit: 'Bananas'),
        ],
      ),
    );
  }
}

class FruitButton extends StatelessWidget {
  final String fruit;
  FruitButton({required this.fruit});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          Provider.of<FavoritesLogic>(context, listen: false)
              .changeFruit(fruit);
        },
        child: Text(fruit));
  }
}
