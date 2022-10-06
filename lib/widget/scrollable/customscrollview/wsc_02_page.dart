import 'package:flutter/material.dart';

class Wsc02Page extends StatefulWidget {
  const Wsc02Page({super.key});

  @override
  State<Wsc02Page> createState() => _Wsc02PageState();
}

class _Wsc02PageState extends State<Wsc02Page> {
  @override
  Widget build(BuildContext context) {
    var listView = SliverFixedExtentList(
      itemExtent: 56,
      delegate: SliverChildBuilderDelegate(
        (_, index) => ListTile(title: Text('$index')),
        childCount: 10,
      ),
    );
    return CustomScrollView(
      slivers: [
        listView,
        listView,
      ],
    );
  }
}
