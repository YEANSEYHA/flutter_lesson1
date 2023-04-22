import 'package:flutter/material.dart';
import 'package:lesson01/multitask_modules/models/randomuser_model.dart';

class RandomUserDetailPage extends StatefulWidget {
  final Result item;

  RandomUserDetailPage(this.item);

  @override
  State<RandomUserDetailPage> createState() => _RandomUserDetailPageState();
}

class _RandomUserDetailPageState extends State<RandomUserDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text(widget.item.name.first),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    Result item = widget.item;

    return ListView(
      children: [
        Card(
          child: Image.network(
            item.picture.large,
            fit: BoxFit.cover,
          ),
        ),
        Card(
          child: ListTile(
            leading: Icon(Icons.account_circle),
            title: Text(
                "${item.name.title}, ${item.name.first} ${item.name.last}"),
            subtitle: Text("${item.dob.age} years old"),
          ),
        ),
        Card(
          child: ListTile(
            leading: Icon(Icons.call),
            title: Text("${item.cell}"),
          ),
        ),
        Card(
          child: ListTile(
            leading: Icon(Icons.email),
            title: Text("${item.email}"),
          ),
        ),
        Card(
          child: ListTile(
            leading: Icon(Icons.home),
            title: Text(
                "${item.location.state}, ${item.location.city}, ${item.location.country}"),
          ),
        ),
        Card(
          child: ListTile(
            leading: Icon(Icons.pin_drop),
            title: Text(
                "${item.location.coordinates.latitude}, ${item.location.coordinates.longitude}"),
          ),
        ),
      ],
    );
  }
}
