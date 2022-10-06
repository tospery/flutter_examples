import 'package:flutter/material.dart';
import '../widget_scrollable_page.dart';

class Wsc04Page extends StatefulWidget {
  const Wsc04Page({super.key});

  @override
  State<Wsc04Page> createState() => _Wsc04PageState();
}

class _Wsc04PageState extends State<Wsc04Page> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: SizedBox(
            height: 300,
            child: PageView(
              children: const [Text("1"), Text("2")],
            ),
          ),
        ),
        buildSliverList(10),
      ],
    );
  }
}
