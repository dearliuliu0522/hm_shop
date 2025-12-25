import 'package:flutter/material.dart';
import 'package:hm_shop/pages/cart/index.dart';
import 'package:hm_shop/pages/cate/index.dart';
import 'package:hm_shop/pages/home/index.dart';
import 'package:hm_shop/pages/my/index.dart';

class MainPage extends StatefulWidget {
  MainPage({Key? key}) : super(key: key);

  @override
  _MainpageState createState() => _MainpageState();
}

class _MainpageState extends State<MainPage> {
  final List<Map<String, String>> _bottomNavItems = [
    {
      "icon": "lib/assets/ic_public_home_default.png",
      "active_icon": "lib/assets/ic_public_home_active.png",
      "label": "首页",
    },
    {
      "icon": "lib/assets/ic_public_cate_default.png",
      "active_icon": "lib/assets/ic_public_cate_active.png",
      "label": "分类",
    },
    {
      "icon": "lib/assets/ic_public_cart_default.png",
      "active_icon": "lib/assets/ic_public_cart_active.png",
      "label": "购物车",
    },
    {
      "icon": "lib/assets/ic_public_my_default.png",
      "active_icon": "lib/assets/ic_public_my_active.png",
      "label": "我的",
    },
  ];

  int _currentIndex = 0;

  List<BottomNavigationBarItem> _getTabBarWidget() {
    return List.generate(_bottomNavItems.length, (int index) {
      return BottomNavigationBarItem(
        icon: Image.asset(
          _bottomNavItems[index]["icon"]!,
          width: 30,
          height: 30,
        ),
        activeIcon: Image.asset(
          _bottomNavItems[index]["active_icon"]!,
          width: 30,
          height: 30,
        ),
        label: _bottomNavItems[index]["label"]!,
      );
    });
  }

  List<Widget> _getChildren() {
    return [HomeView(), CategoryView(), CartView(), MyView()];
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
          setState(() {
            _currentIndex = index;
          });
        },
        // 禁用动画效果
        type: BottomNavigationBarType.fixed,
        showUnselectedLabels: true,
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.grey,
      ),
    );
  }
}
