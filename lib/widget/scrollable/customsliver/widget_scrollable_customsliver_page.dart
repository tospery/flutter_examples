import 'package:flutter/material.dart';
import '../../../utils/function.dart';

class WidgetScrollableCustomSliverPage extends StatelessWidget {
  const WidgetScrollableCustomSliverPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: generateItem(
        context,
        [],
      ),
    );
  }
}
