import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar,
      body: _buildBody,
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

  Widget get _buildFloating {
    return FloatingActionButton(
      onPressed: () {},
      child: Icon(Icons.pin_drop),
    );
  }
}
