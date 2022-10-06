import 'package:flutter/material.dart';
import '../../../utils/function.dart';
import 'wsc_01_page.dart';
import 'wsc_02_page.dart';
import 'wsc_03_page.dart';
import 'wsc_04_page.dart';
import 'wsc_05_page.dart';

class WidgetScrollableCustomScrollViewPage extends StatelessWidget {
  const WidgetScrollableCustomScrollViewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: generateItem(
        context,
        [
          PageInfo("两个ListView", (ctx) => const Wsc01Page()),
          PageInfo("合并两个List", (ctx) => const Wsc02Page()),
          PageInfo(
            "CustomScrollView示例",
            (ctx) => const Wsc03Page(),
            hideAppBar: true,
          ),
          PageInfo("SliverToBoxAdapter示例", (ctx) => const Wsc04Page()),
          PageInfo("SliverPersistentHeader示例", (ctx) => const Wsc05Page()),
        ],
      ),
    );
  }
}
