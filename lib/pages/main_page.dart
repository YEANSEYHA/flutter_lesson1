import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar,
      body: _buildBody2,
      bottomNavigationBar: _buildBottom,
      floatingActionButton: _buildFloating,
    );
  }

  AppBar get _buildAppBar {
    return AppBar(
      title: Text(
        'Hello',
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          fontStyle: FontStyle.italic,
        ),
        overflow: TextOverflow.clip,
      ),
      centerTitle: true,
      backgroundColor: Colors.pinkAccent,
      leading: Icon(FontAwesomeIcons.share),
      actions: [
        IconButton(onPressed: () {}, icon: Icon(CupertinoIcons.person)),
        IconButton(onPressed: () {}, icon: Icon(CupertinoIcons.share))
      ],
    );
  }

  Widget get _buildBody {
    String src =
        "https://i.pinimg.com/736x/c2/cd/2b/c2cd2b12ecc14805bc93bb2fbeaddbed.jpg";
    return Container(
      padding: EdgeInsets.all(20),
      alignment: Alignment.center,
      child: InkWell(
          child: Image.network(src),
          onTap: () {
            print('Image clicked');
          }),
    );
  }

  Widget get _buildBottom {
    return BottomAppBar(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(onPressed: () {}, icon: Icon(CupertinoIcons.home)),
          IconButton(onPressed: () {}, icon: Icon(CupertinoIcons.person)),
          IconButton(onPressed: () {}, icon: Icon(Icons.more_horiz)),
        ],
      ),
    );
  }

  Widget get _buildBody2 {
    return Container(
      color: Color.fromARGB(255, 173, 173, 173),
      alignment: Alignment.center,
      child: _buildCircleImage(
          "https://phantom-marca.unidadeditorial.es/39e946fa35be43d0abcde9d0732bfb34/resize/1320/f/jpg/assets/multimedia/imagenes/2022/05/24/16534218383219.jpg"),
    );
  }

  Widget _buildCircleImage(String Image,
      {double width = 200, double height = 200}) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
          color: Colors.deepOrange,
          shape: BoxShape.circle,
          image:
              DecorationImage(image: NetworkImage(Image), fit: BoxFit.cover)),
    );
  }

  Widget _buildCircle() {
    return Container(
      width: 150,
      height: 150,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.green,
          gradient: LinearGradient(
            stops: [0.4, 0.5],
            colors: [
              Colors.yellow,
              Colors.purple,
            ],
          )),
    );
  }

  Widget _buildButton(String text) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Text(
        text,
        style: TextStyle(fontSize: 30),
      ),
      decoration: BoxDecoration(
          color: Colors.pink,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
                color: Colors.brown,
                offset: Offset(3, 3),
                blurRadius: 3,
                spreadRadius: 3)
          ]),
    );
  }

  Widget get _buildFloating {
    return FloatingActionButton(
      onPressed: () {},
      child: Icon(Icons.pin_drop),
    );
  }
}
