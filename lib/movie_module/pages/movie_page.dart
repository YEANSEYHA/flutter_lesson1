import 'package:flutter/material.dart';
import 'package:lesson01/movie_module/constants/movie_list_constant.dart';
import 'package:lesson01/movie_module/pages/movie_detail_page.dart';
import 'package:lesson01/movie_module/widgets/slideshow_widget.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../models/movie_model.dart';

class MoviePage extends StatefulWidget {
  const MoviePage({Key? key}) : super(key: key);

  @override
  State<MoviePage> createState() => _MoviePageState();
}

class _MoviePageState extends State<MoviePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Movie 24")),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return ListView(
      children: [
        _buildCarousel(),
        _buildTopPanel(),
        _buildHorizontalListView(),
        _buildGridView(),
        _buildListView(),
      ],
    );
  }

  Widget _buildCarousel() {
    return CarouselSlider.builder(
      options: CarouselOptions(),
      itemCount: movieList.length,
      itemBuilder: (context, index, pageViewIndex) {
        return _buildCarouselItem(movieList[index]);
      },
    );
  }

  Widget _buildCarouselItem(MovieModel item) {
    return SizedBox(
      width: double.maxFinite,
      child: Image.network(item.image, fit: BoxFit.cover),
    );
  }

  Widget _buildHorizontalListView() {
    return Container(
      height: 300,
      padding: EdgeInsets.symmetric(vertical: 20),
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: movieList.length,
        itemBuilder: (context, index) {
          return _buildHorizontalItem(movieList[index]);
        },
      ),
    );
  }

  Widget _buildHorizontalItem(MovieModel item) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => MovieDetailPage(item),
            fullscreenDialog: true,
          ),
        );
      },
      child: Container(
        width: 230,
        // height: 1000, //Don't set height because it doesn't affect
        margin: EdgeInsets.all(5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            image: NetworkImage(item.image),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget _buildTopPanel() {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          _buildProfile(_cris, "@cris_tiktok"),
          SizedBox(height: 10),
          _buildRowLike(),
          SizedBox(height: 10),
          _buildRowFollow(),
        ],
      ),
    );
  }

  String _cris =
      "https://variety.com/wp-content/uploads/2022/11/GettyImages-1442079658.jpg?w=1000&h=563&crop=1";

  Widget _buildProfile(String image, String id) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          CircleAvatar(
            radius: 70,
            backgroundImage: NetworkImage(image),
          ),
          SizedBox(height: 10),
          Text(id),
        ],
      ),
    );
  }

  Widget _buildRowLike() {
    return SizedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildIconWithText(Icons.thumb_up, "56.2K"),
          SizedBox(width: 30),
          _buildIconWithText(Icons.favorite, "135K"),
          SizedBox(width: 30),
          _buildIconWithText(Icons.video_collection, "121"),
        ],
      ),
    );
  }

  Widget _buildIconWithText(IconData icon, String text) {
    return Column(
      children: [
        Icon(icon),
        Text(text),
      ],
    );
  }

  Widget _buildRowFollow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildFollowButton(),
        SizedBox(width: 10),
        _buildDownMenuIcon(),
        SizedBox(width: 10),
        _buildPlayIcon(),
      ],
    );
  }

  Widget _buildFollowButton() {
    return SizedBox(
      width: 200,
      child: ElevatedButton(
        onPressed: () {},
        child: Text("FOLLOW"),
      ),
    );
  }

  Widget _buildDownMenuIcon() {
    return TextButton(
      onPressed: () {},
      child: Icon(Icons.arrow_drop_down_outlined),
    );
  }

  Widget _buildPlayIcon() {
    return TextButton(
      onPressed: () {},
      child: Icon(Icons.play_arrow),
    );
  }

  Widget _buildGridView() {
    return GridView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 130,
        crossAxisSpacing: 5,
        mainAxisSpacing: 5,
        childAspectRatio: 6 / 12,
      ),
      itemCount: movieList.length,
      itemBuilder: (context, index) {
        return _buildGridItem(movieList[index]);
      },
    );
  }

  Widget _buildGridItem(MovieModel item) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => MovieDetailPage(item),
          ),
        );
      },
      child: Image.network(
        item.image,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _buildListView() {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: movieList.length,
      itemBuilder: (context, index) {
        return _buildItem(movieList[index], corner: 20);
      },
    );
  }

  Widget _buildItem(MovieModel item, {double corner = 10}) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => MovieDetailPage(item),
          ),
        );
      },
      child: Container(
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            Container(
              height: 350,
              width: double.maxFinite,
              decoration: BoxDecoration(
                // color: Colors.grey[900],
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(corner),
                  topRight: Radius.circular(corner),
                ),
                image: DecorationImage(
                  image: NetworkImage(item.image),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.grey[800],
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(corner),
                  bottomRight: Radius.circular(corner),
                ),
              ),
              child: Text("${item.title}"),
            ),
          ],
        ),
      ),
    );
  }
}
