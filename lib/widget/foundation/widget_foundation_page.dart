import 'package:flutter/material.dart';
import '../../utils/function.dart';
import 'widget_foundation_text.dart';

class WidgetFoundationPage extends StatelessWidget {
  const WidgetFoundationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: generateItem(
        context,
        [
          PageInfo("文本", (ctx) => const WidgetFoundationTextPage()),
        ],
      ),
    );
  }
}
