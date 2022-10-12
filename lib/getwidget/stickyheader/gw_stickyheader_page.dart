import 'package:flutter/material.dart' hide Page;
import 'package:flukit/example/example.dart';

class GWStickyHeaderPage extends StatelessWidget {
  const GWStickyHeaderPage({super.key});

  List<Page> getRoutes() {
    return [];
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
