import 'package:flutter/cupertino.dart';
import 'package:hm_shop/components/home/HmCategary.dart';
import 'package:hm_shop/components/home/HmHot.dart';
import 'package:hm_shop/components/home/HmMoreList.dart';
import 'package:hm_shop/components/home/HmSlider.dart';
import 'package:hm_shop/components/home/HmSuggestion.dart';

class HomeView extends StatefulWidget {
  HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  // 获取滚动容器的内容
  List<Widget> _getScrollChildren() {
    return [
      // 轮播图组件
      SliverToBoxAdapter(child: Hmslider()),
      // 组件间距
      SliverToBoxAdapter(child: SizedBox(height: 10)),
      // 分类组件
      SliverToBoxAdapter(child: Hmcategary()),
      // 组件间距
      SliverToBoxAdapter(child: SizedBox(height: 10)),
      // 推荐组件
      SliverToBoxAdapter(child: Hmsuggestion()),
      // 组件间距
      SliverToBoxAdapter(child: SizedBox(height: 10)),
      // 爆款组件
      SliverToBoxAdapter(
        child: Padding(
          padding: EdgeInsetsGeometry.symmetric(horizontal: 10),
          child: Flex(
            direction: Axis.horizontal,
            children: [
              Expanded(child: Hmhot()),
              SizedBox(width: 10),
              Expanded(child: Hmhot()),
            ],
          ),
        ),
      ),
      // 组件间距
      SliverToBoxAdapter(child: SizedBox(height: 10)),
      // 商品列表组件
      Hmmorelist(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(slivers: _getScrollChildren());
  }
}
