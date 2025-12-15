import 'package:flutter/material.dart';
import 'package:hm_shop/pages/cart/index.dart';
import 'package:hm_shop/pages/cate/index.dart';
import 'package:hm_shop/pages/home/index.dart';
import 'package:hm_shop/pages/my/index.dart';

class MainPage extends StatefulWidget {
  MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  // 定义数据，根据数据渲染4个导航
  final List<Map<String, String>> _tabList = [
    {
      "default": "lib/assets/ic_public_home_default.png",
      "active": "lib/assets/ic_public_home_active.png",
      "text": "首页",
    },
    {
      "default": "lib/assets/ic_public_cate_default.png",
      "active": "lib/assets/ic_public_cate_active.png",
      "text": "分类",
    },
    {
      "default": "lib/assets/ic_public_cart_default.png",
      "active": "lib/assets/ic_public_cart_active.png",
      "text": "购物车",
    },
    {
      "default": "lib/assets/ic_public_my_default.png",
      "active": "lib/assets/ic_public_my_active.png",
      "text": "我的",
    },
  ];

  int _currentIndex = 0;

  List<BottomNavigationBarItem> _getTabBarWidget() {
    return List.generate(_tabList.length, (int index) {
      return BottomNavigationBarItem(
        icon: Image.asset(_tabList[index]["default"]!, width: 30, height: 30),
        activeIcon: Image.asset(
          _tabList[index]["active"]!,
          width: 30,
          height: 30,
        ),
        label: _tabList[index]["text"],
      );
    });
  }

  List<Widget> _getChildren() {
    return [HomeView(), CategaryView(), CartView(), MyView()];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: IndexedStack(children: _getChildren(), index: _currentIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: _getTabBarWidget(),
        currentIndex: _currentIndex,
        onTap: (int index) {
          _currentIndex = index;
          setState(() {});
        },
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
      ),
    );
  }
}
