import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:lesson01/movie_module/models/movie_model.dart';

class MovieDetailPage extends StatefulWidget {
  MovieModel item;
  MovieDetailPage(this.item);

  @override
  State<MovieDetailPage> createState() => _MovieDetailPageState();
}

class _MovieDetailPageState extends State<MovieDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: Text(widget.item.title),
    );
  }

  Widget _buildBody() {
    return ListView(
      physics: BouncingScrollPhysics(),
      children: [
        Container(
          height: 500,
          child: Image.network(
            widget.item.image,
            fit: BoxFit.cover,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(widget.item.des),
        )
      ],
    );
  }
}
