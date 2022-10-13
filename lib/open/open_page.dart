import 'package:flutter/material.dart' hide Page;
import 'package:flukit/example/example.dart';
import 'flukit/op_flukit_page.dart';

class OpenPage extends StatelessWidget {
  const OpenPage({super.key});

  List<Page> getRoutes() {
    return [
      Page("flukit(3.0.1)", const OPFlukitPage()),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListPage(
        children: getRoutes(),
      ),
    );
  }
}
