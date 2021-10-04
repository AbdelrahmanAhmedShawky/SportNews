import 'package:flutter/material.dart';
import 'package:sport_news_app/ui/home.dart';

class MainSreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainSreen> {
  PageController _pageController;
  int _page = 0;

  List icons = [
    Icons.search,
    Icons.local_pizza,
    Icons.brightness_1,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: _pageController,
        onPageChanged: onPageChange,
        children: List.generate(3, (index) => Home()),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(width: 7),
            buildTabIcon(0),
            buildTabIcon(1),
            buildTabIcon(2),
            SizedBox(width: 7),
          ],
        ),
        color: Theme.of(context).primaryColor,
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  void onPageChange(int page) {
    setState(() {
      this._page = page;
    });
  }

  buildTabIcon(int index) {
    return IconButton(
      icon: Icon(
        icons[index],
        size: 24.0,
      ),
      color: _page == index
          ? Theme.of(context).accentColor
          : Theme.of(context).textTheme.caption.color,
      onPressed: () => _pageController.jumpToPage(index),
    );
  }
}
