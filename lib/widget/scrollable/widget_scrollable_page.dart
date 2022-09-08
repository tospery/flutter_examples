import 'package:flutter/material.dart';
import '../../utils/function.dart';
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
            "嵌套可滚动组件NestedScrollView",
            (ctx) => const WidgetScrollableNestedScrollViewPage(),
          ),
        ],
      ),
    );
  }
}
