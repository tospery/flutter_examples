import 'package:flutter/material.dart' hide Page;
import 'package:flukit/example/example.dart';

class InactionPage extends StatelessWidget {
  const InactionPage({super.key});

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
