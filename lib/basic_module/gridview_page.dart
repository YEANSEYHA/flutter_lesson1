import 'package:flutter/material.dart';

class GridViewPage extends StatefulWidget {
  const GridViewPage({Key? key}) : super(key: key);

  @override
  State<GridViewPage> createState() => _GridViewPageState();
}

class _GridViewPageState extends State<GridViewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return _buildGridViewExtent();
  }

  Widget _buildGridViewExtent() {
    return GridView.extent(
      physics: BouncingScrollPhysics(),
      reverse: true,
      padding: EdgeInsets.all(5),
      maxCrossAxisExtent: 120,
      crossAxisSpacing: 10,
      mainAxisSpacing: 20,
      childAspectRatio: 9 / 16, //(x/y)
      children: [
        Container(width: 70, height: 150, color: Colors.pink),
        Container(width: 50, height: 70, color: Colors.orange),
        Container(width: 80, height: 100, color: Colors.lime),
        Container(width: 90, height: 60, color: Colors.blue),
        Container(width: 180, height: 100, color: Colors.cyan),
        Container(width: 190, height: 60, color: Colors.purple),
        Container(width: 70, height: 150, color: Colors.pink),
        Container(width: 50, height: 70, color: Colors.orange),
        Container(width: 80, height: 100, color: Colors.lime),
        Container(width: 90, height: 60, color: Colors.blue),
        Container(width: 180, height: 100, color: Colors.cyan),
        Container(width: 190, height: 60, color: Colors.purple),
      ],
    );
  }

  Widget _buildGridViewCount() {
    return GridView.count(
      padding: EdgeInsets.all(5),
      crossAxisCount: 3,
      crossAxisSpacing: 10,
      mainAxisSpacing: 20,
      childAspectRatio: 9 / 16, //(x/y)
      children: [
        Container(width: 70, height: 150, color: Colors.pink),
        Container(width: 50, height: 70, color: Colors.orange),
        Container(width: 80, height: 100, color: Colors.lime),
        Container(width: 90, height: 60, color: Colors.blue),
        Container(width: 180, height: 100, color: Colors.cyan),
        Container(width: 190, height: 60, color: Colors.purple),
      ],
    );
  }
}
