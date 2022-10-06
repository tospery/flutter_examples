import 'package:flutter/material.dart';
import '../widget_scrollable_page.dart';

class Wsn02Page extends StatelessWidget {
  const Wsn02Page({super.key});

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return <Widget>[
          // 实现 snap 效果
          SliverAppBar(
            floating: true,
            snap: true,
            expandedHeight: 200,
            forceElevated: innerBoxIsScrolled,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                "res/images/sea.png",
                fit: BoxFit.cover,
              ),
            ),
          ),
        ];
      },
      body: Builder(builder: (BuildContext context) {
        return CustomScrollView(
          slivers: <Widget>[buildSliverList(100)],
        );
      }),
    );
  }
}
