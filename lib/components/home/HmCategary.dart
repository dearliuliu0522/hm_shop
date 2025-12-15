import 'package:flutter/material.dart';

class Hmcategary extends StatefulWidget {
  Hmcategary({Key? key}) : super(key: key);

  @override
  _HmcategaryState createState() => _HmcategaryState();
}

class _HmcategaryState extends State<Hmcategary> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            alignment: Alignment.center,
            margin: EdgeInsets.symmetric(horizontal: 10),
            width: 80,
            height: 100,
            color: Colors.blue,
            child: Text("分类${index}", style: TextStyle(color: Colors.white)),
          );
        },
      ),
    );
  }
}
