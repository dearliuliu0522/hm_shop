import 'package:flutter/material.dart';
import 'package:hm_shop/viewmodels/home.dart';

class HmCategory extends StatefulWidget {
  List<CategoryItem> categoryList;
  HmCategory({Key? key, required this.categoryList}) : super(key: key);

  @override
  _HmCategoryState createState() => _HmCategoryState();
}

class _HmCategoryState extends State<HmCategory> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.categoryList.length,
        itemBuilder: (BuildContext context, int index) {
          final category = widget.categoryList[index];
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            width: 80,
            height: 100,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 223, 225, 226),
              borderRadius: BorderRadius.circular(40),
            ),
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.network(category.picture, width: 40, height: 40),
                Text(category.name, style: TextStyle(color: Colors.black)),
              ],
            ),
          );
        },
      ),
    );
  }
}
