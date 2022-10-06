import 'package:flutter/material.dart';
import '../../utils/function.dart';
import 'customscrollview/widget_scrollable_customscrollview_page.dart';
import 'customsliver/widget_scrollable_customsliver_page.dart';
import 'nestedscrollview/widget_scrollable_nestedscrollview_page.dart';

class WidgetScrollablePage extends StatelessWidget {
  const WidgetScrollablePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: generateItem(
        context,
        [
          PageInfo(
            "CustomScrollView和Slivers",
            (ctx) => const WidgetScrollableCustomScrollViewPage(),
          ),
          PageInfo(
            "自定义Sliver",
            (ctx) => const WidgetScrollableCustomSliverPage(),
          ),
          PageInfo(
            "嵌套可滚动组件NestedScrollView",
            (ctx) => const WidgetScrollableNestedScrollViewPage(),
          ),
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
