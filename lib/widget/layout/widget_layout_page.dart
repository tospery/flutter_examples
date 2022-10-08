import 'package:flutter/material.dart';
import '../../utils/function.dart';
import 'stack/widget_layout_stack_page.dart';

class WidgetLayoutPage extends StatelessWidget {
  const WidgetLayoutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: generateItem(
        context,
        [
          PageInfo(
            "层叠布局（Stack、Positioned）",
            (ctx) => const WidgetLayoutStackPage(),
          ),
        ],
      ),
    );
  }
}