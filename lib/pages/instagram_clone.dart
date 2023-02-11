import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:crypto/crypto.dart';
import 'dart:convert';

class instagramClone extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar,
      body: Column(children: <Widget>[_buildListStory, _buildpost]),
      bottomNavigationBar: Text('Make me like instagram!!'),
    );
  }

  AppBar get _buildAppBar {
    return AppBar(
      title: Text(
        'Instagram',
        style: TextStyle(
            fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
        overflow: TextOverflow.clip,
      ),
      centerTitle: true,
      backgroundColor: Colors.white,
      leading: Icon(CupertinoIcons.photo_camera, color: Colors.black),
      actions: [
        IconButton(
            onPressed: () {},
            icon: Icon(CupertinoIcons.tv_circle),
            color: Colors.black),
        IconButton(
            onPressed: () {},
            icon: Icon(CupertinoIcons.arrow_up_right_circle_fill,
                color: Colors.black))
      ],
    );
  }

  Widget get _buildListStory {
    return Container(
      height: 100,
      child: ListView(
        padding: const EdgeInsets.all(8),
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Container(
            height: 50,
            color: Colors.amber[600],
            child: const Center(child: Text('Make this list view to dynamic')),
          ),
          Container(
            height: 50,
            color: Colors.amber[500],
            child: const Center(child: Text('Entry B')),
          ),
          Container(
            height: 50,
            color: Colors.amber[100],
            child: const Center(child: Text('Entry C')),
          ),
          Container(
            height: 50,
            color: Colors.amber[100],
            child: const Center(child: Text('Entry C')),
          ),
          Container(
            height: 50,
            color: Colors.amber[100],
            child: const Center(child: Text('Entry C')),
          ),
          Container(
            height: 50,
            color: Colors.amber[100],
            child: const Center(child: Text('Entry C')),
          ),
          Container(
            height: 50,
            color: Colors.amber[100],
            child: const Center(child: Text('Entry C')),
          ),
          Container(
            height: 50,
            color: Colors.amber[100],
            child: const Center(child: Text('Entry C')),
          ),
        ],
      ),
    );
  }

  Widget get _buildpost {
    return Container(
      height: 500,
      child: ListView(
        children: <Widget>[
          Container(
            height: 450,
            color: Colors.amber[600],
            child: const Center(child: Text('Each Instaram post')),
          ),
          Container(
            height: 450,
            color: Colors.amber[600],
            child: const Center(child: Text('Each Instaram post')),
          ),
          Container(
            height: 450,
            color: Colors.amber[600],
            child: const Center(child: Text('Each Instaram post')),
          ),
          Container(
            height: 450,
            color: Colors.amber[600],
            child: const Center(child: Text('Each Instaram post')),
          ),
          Container(
            height: 450,
            color: Colors.amber[600],
            child: const Center(child: Text('Each Instaram post')),
          ),
        ],
      ),
    );
  }
}
