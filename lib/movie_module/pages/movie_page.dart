import 'package:flutter/material.dart';
import 'package:lesson01/movie_module/constants/movie_list_constant.dart';
import 'package:lesson01/movie_module/models/movie_model.dart';

class MoviePage extends StatefulWidget {
  const MoviePage({Key? key}) : super(key: key);

  @override
  State<MoviePage> createState() => _MoviePageState();
}

class _MoviePageState extends State<MoviePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
        title: Text("Movie 365"),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return ListView.builder(
      itemCount: movieList.length,
      itemBuilder: (context, index) {
        return _buildItem(movieList[index]);
      },
    );
  }

  List<String> _images = [
    "https://m.media-amazon.com/images/M/MV5BYzFhM2M1MDUtNDhmNC00YzEzLThiMzctYWYxZTc0MGJhNWYyXkEyXkFqcGdeQXVyMTUzMTg2ODkz._V1_FMjpg_UX1000_.jpg",
    "https://imageio.forbes.com/specials-images/imageserve/63bc9f3ad64762ff31f26064/0x0.jpg?format=jpg&width=1200",
    "https://media.glamour.com/photos/638e476b4640457ce2470cc8/master/w_382,h_566,c_limit/antmanandthewaspquantumania_lob_crd_02.jpg",
    "https://m.media-amazon.com/images/M/MV5BN2FkOWQ3YzItNmNhZi00ZWNlLThjYTMtZWIyZDc2YjQzMjk3XkEyXkFqcGdeQXVyMTkxNjUyNQ@@._V1_.jpg",
    "https://fr.web.img2.acsta.net/pictures/22/07/29/09/44/2282623.jpg",
    "https://source.boomplaymusic.com/buzzgroup2/M00/37/DE/rBEeJGKxjXyAfuaLAALDc3CS9iQ25.jpeg",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQvcuH9KP84U97TwcQIPutP2WdsG8Yuo6RSr2qmXCs7QXNqdUh20tlB3E67aZgHBIP8sbw&usqp=CAU",
    "https://images.fandango.com/ImageRenderer/0/0/redesign/static/img/default_poster.png/0/images/masterrepository/Fandango/230357/TDC_Poster_THEATRE_27x40_LowRes.jpg",
  ];

  Widget _buildListViewBuilder() {
    return ListView.builder(
      physics: BouncingScrollPhysics(),
      reverse: false,
      itemCount: _images.length,
      itemBuilder: (context, index) {
        return _buildItem(_images[index]);
      },
    );
  }

  Widget _buildItem(String item) {
    return Container(
      height: 300,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
          image: NetworkImage(item),
          fit: BoxFit.cover,
        ),
      ),
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
    );
  }

  final _scrollController = ScrollController();

  Widget _buildSimpleListView() {
    return ListView(
      reverse: true,
      controller: _scrollController,
      physics: BouncingScrollPhysics(),
      children: [
        Container(width: 170, height: 150, color: Colors.pink),
        Container(width: 50, height: 170, color: Colors.orange),
        Container(width: 80, height: 100, color: Colors.lime),
        Container(width: 90, height: 160, color: Colors.blue),
        Container(width: 180, height: 100, color: Colors.cyan),
        Container(width: 190, height: 160, color: Colors.purple),
      ],
    );
  }
}
