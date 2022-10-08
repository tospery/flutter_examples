import 'package:flutter/material.dart';
import '../../../utils/function.dart';
import 'wls_01_page.dart';
import 'wls_02_page.dart';

class WidgetLayoutStackPage extends StatelessWidget {
  const WidgetLayoutStackPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: generateItem(
        context,
        [
          PageInfo("Stack/Positioned示例（一）", (ctx) => const Wls01Page()),
          PageInfo("Stack/Positioned示例（二）", (ctx) => const Wls02Page()),
        ],
      ),
    );
  }
}
