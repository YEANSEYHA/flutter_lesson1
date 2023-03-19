import 'package:flutter/material.dart';

class HomePageExampleProvider extends StatefulWidget {
  const HomePageExampleProvider({super.key});

  @override
  State<HomePageExampleProvider> createState() =>
      _HomePageExampleProviderState();
}

class _HomePageExampleProviderState extends State<HomePageExampleProvider> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Fruit is unkown')), body: _buildColumn());
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
    return ElevatedButton(onPressed: () {}, child: Text(fruit));
  }
}
