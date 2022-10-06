import 'package:flutter/material.dart';
import '../widget_scrollable_page.dart';

class Wsn04Page extends StatefulWidget {
  const Wsn04Page({super.key});

  @override
  State<Wsn04Page> createState() => _Wsn04PageState();
}

class _Wsn04PageState extends State<Wsn04Page> {
// 将handle 缓存
  late SliverOverlapAbsorberHandle handle;

  void onOverlapChanged() {
    // 打印 overlap length
    // ignore: avoid_print
    print(handle.layoutExtent);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          handle = NestedScrollView.sliverOverlapAbsorberHandleFor(context);
          //添加监听前先移除旧的
          handle.removeListener(onOverlapChanged);
          //overlap长度发生变化时打印
          handle.addListener(onOverlapChanged);
          return <Widget>[
            SliverOverlapAbsorber(
              handle: handle,
              sliver: SliverAppBar(
                floating: true,
                snap: true,
                // pinned: true, // 放开注释，然后看日志
                expandedHeight: 200,
                flexibleSpace: FlexibleSpaceBar(
                  background: Image.asset(
                    "res/images/sea.png",
                    fit: BoxFit.cover,
                  ),
                ),
                forceElevated: innerBoxIsScrolled,
              ),
            ),
          ];
        },
        body: LayoutBuilder(builder: (BuildContext context, cons) {
          return CustomScrollView(
            slivers: <Widget>[
              SliverOverlapInjector(handle: handle),
              buildSliverList(100)
            ],
          );
        }),
      ),
    );
  }

  @override
  void dispose() {
    // 移除监听器
    handle.removeListener(onOverlapChanged);
    super.dispose();
  }
}
