import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pphelper/pages/category_page.dart';
import 'home_page.dart';
import 'bus_page.dart';
import 'person_page.dart';
import 'message_page.dart';

/**
 * Index首页
 */

class IndexPage extends StatefulWidget {
  const IndexPage({Key? key}) : super(key: key);

  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  //页面切换列表
  final List<BottomNavigationBarItem> bottoms = [
    BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.home),
        label: "首页"
    ),
    BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.rectangle_grid_2x2),
        label: "分类"
    ),
    BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.bubble_left),
        label: "消息"
    ),
    BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.cart),
        label: "购物车"
    ),
    BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.person),
        label: "我的"
    ),
  ];

  //页面
  final List pages = [
    HomePage(),
    CategoryPage(),
    MessagePage(),
    BusPage(),
    PersonPage()
  ];

  int currentIndex = 0; //当前页下标
  var currentPage;  //当前页

  @override
  void initState() {
    currentPage = pages[currentIndex];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        items: bottoms,
        onTap: (index) {
          this.setState(() {
            currentIndex = index;
            currentPage = pages[currentIndex];
          });
        },
      ),
      body: currentPage,
    );
  }
}

