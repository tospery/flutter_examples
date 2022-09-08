import 'package:flutter/material.dart';
import '../../../utils/function.dart';
import 'wsn_01_page.dart';
import 'wsn_02_page.dart';
import 'wsn_03_page.dart';
import 'wsn_04_page.dart';
import 'wsn_05_page.dart';

class WidgetScrollableNestedScrollViewPage extends StatelessWidget {
  const WidgetScrollableNestedScrollViewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: generateItem(
        context,
        [
          PageInfo("NestedScrollView示例", (ctx) => const Wsn01Page()),
          PageInfo("SliverAppBar示例", (ctx) => const Wsn02Page()),
          PageInfo("SliverAppBar上滑显示（最佳实现）", (ctx) => const Wsn03Page()),
          PageInfo("SliverAppBar上滑显示（另类实现）", (ctx) => const Wsn04Page()),
          PageInfo("嵌套TabBarView", (ctx) => const Wsn05Page()),
        ],
      ),
    );
  }
}

// 构建固定高度的SliverList，count为列表项属相
Widget buildSliverList([int count = 5]) {
  return SliverFixedExtentList(
    itemExtent: 50,
    delegate: SliverChildBuilderDelegate(
      (context, index) {
        return ListTile(title: Text('$index'));
      },
      childCount: count,
    ),
  );
}
