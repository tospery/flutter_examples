import 'package:flutter/material.dart';
import '../widget_scrollable_page.dart';

class Wsn01Page extends StatelessWidget {
  const Wsn01Page({super.key});

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        // 返回一个 Sliver 数组给外部可滚动组件。
        return <Widget>[
          SliverAppBar(
            title: const Text('嵌套ListView'),
            pinned: true, // 固定在顶部
            forceElevated: innerBoxIsScrolled,
          ),
          buildSliverList(5), //构建一个 sliverList
        ];
      },
      body: ListView.builder(
        padding: const EdgeInsets.all(8),
        physics: const ClampingScrollPhysics(), //重要
        itemCount: 30,
        itemBuilder: (BuildContext context, int index) {
          return SizedBox(
            height: 50,
            child: Center(child: Text('Item $index')),
          );
        },
      ),
    );
  }
}
