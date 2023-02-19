import 'package:flutter/material.dart';
import 'package:lesson01/movie_module/constants/movie_list_constant.dart';
import 'package:lesson01/movie_module/models/movie_model.dart';

class PageViewPage extends StatefulWidget {
  const PageViewPage({super.key});

  @override
  State<PageViewPage> createState() => _PageViewPageState();
}

class _PageViewPageState extends State<PageViewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return _buildPageViewBuilder();
  }

  Widget _buildPageViewBuilder() {
    return PageView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: movieList.length,
        itemBuilder: (context, index) {
          return _buildPageItem(movieList[index]);
        });
  }

  Widget _buildPageItem(MovieModel item) {
    return Image.network(item.image, fit: BoxFit.cover);
  }

  Widget _buildPageView() {
    return SizedBox(
      height: 300,
      child: PageView(
          physics: BouncingScrollPhysics(),
          children: [Container(width: 80, height: 20, color: Colors.pink)]),
    );
  }
}
