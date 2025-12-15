import 'package:flutter/cupertino.dart';

class CategaryView extends StatefulWidget {
  CategaryView({Key? key}) : super(key: key);

  @override
  _CategaryViewState createState() => _CategaryViewState();
}

class _CategaryViewState extends State<CategaryView> {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text("分类"));
  }
}
