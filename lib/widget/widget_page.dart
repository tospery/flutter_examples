import 'package:flutter/material.dart';
import '../utils/function.dart';
import 'foundation/widget_foundation_page.dart';
import 'scrollable/widget_scrollable_page.dart';

class WidgetPage extends StatelessWidget {
  const WidgetPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: generateItem(
        context,
        [
          PageInfo("基础组件", (ctx) => const WidgetFoundationPage()),
          PageInfo("布局组件", (ctx) => const WidgetPage()),
          PageInfo("容器组件", (ctx) => const WidgetPage()),
          PageInfo("可滚动组件", (ctx) => const WidgetScrollablePage()),
          PageInfo("功能型组件", (ctx) => const WidgetPage()),
          PageInfo("自定义组件", (ctx) => const WidgetPage()),
        ],
      ),
    );
  }
}
