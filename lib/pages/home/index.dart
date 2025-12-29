import 'package:flutter/material.dart';
import 'package:hm_shop/api/home.dart';
import 'package:hm_shop/components/HmCategory/index.dart';
import 'package:hm_shop/components/HmHot/index.dart';
import 'package:hm_shop/components/HmMoreList/index.dart';
import 'package:hm_shop/components/HmSlider/index.dart';
import 'package:hm_shop/components/HmSuggestion/index.dart';
import 'package:hm_shop/viewmodels/home.dart';

class HomeView extends StatefulWidget {
  HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  // 分类列表
  List<CategoryItem> _categoryList = [];

  List<BannerItem> _bannerList = [];

  List<Widget> _getSlivers() {
    return [
      SliverToBoxAdapter(child: HmSlider(bannerList: _bannerList)),
      SliverToBoxAdapter(child: SizedBox(height: 10)),
      SliverToBoxAdapter(child: HmCategory(categoryList: _categoryList)),
      SliverToBoxAdapter(child: SizedBox(height: 10)),
      SliverToBoxAdapter(child: HmSuggestion()),
      SliverToBoxAdapter(child: SizedBox(height: 10)),
      SliverToBoxAdapter(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Flex(
            direction: Axis.horizontal,
            children: [
              Expanded(child: HmHot()),
              SizedBox(width: 10),
              Expanded(child: HmHot()),
            ],
          ),
        ),
      ),
      // 组件间距
      SliverToBoxAdapter(child: SizedBox(height: 10)),
      HmMoreList(),
    ];
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getBannerList();
    _getCategoryList();
  }

  void _getBannerList() async {
    _bannerList = await getBannerListAPI();
    setState(() {});
  }

  // 获取分裂列表
  void _getCategoryList() async {
    _categoryList = await getCategoryListAPI();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(slivers: _getSlivers());
  }
}
