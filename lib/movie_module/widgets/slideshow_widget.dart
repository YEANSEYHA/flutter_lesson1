import 'dart:async';

import 'package:flutter/material.dart';

import '../constants/movie_list_constant.dart';
import '../models/movie_model.dart';

class SlideShowWidget extends StatefulWidget {
  const SlideShowWidget({Key? key}) : super(key: key);

  @override
  State<SlideShowWidget> createState() => _SlideShowWidgetState();
}

class _SlideShowWidgetState extends State<SlideShowWidget> {
  Timer? _timer;
  int _counter = 0;
  final _pageController = PageController();

  //ctrl+o / cmd+o
  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(Duration(seconds: 3), (timer) {
      _counter++;
      if (_counter >= movieList.length) {
        _counter = 0;
      }
      debugPrint("_counter: $_counter");
      _pageController.animateToPage(
        _counter,
        duration: Duration(milliseconds: 400),
        curve: Curves.fastOutSlowIn,
      );
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350,
      child: PageView.builder(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _counter = index;
          });
        },
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: movieList.length,
        itemBuilder: (context, index) {
          return _buildPageItem(movieList[index]);
        },
      ),
    );
  }

  Widget _buildPageItem(MovieModel item) {
    return Image.network(item.image, fit: BoxFit.cover);
  }
}
