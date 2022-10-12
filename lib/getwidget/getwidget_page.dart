import 'package:flutter/material.dart' hide Page;
import 'package:flukit/example/example.dart';
import 'stickyheader/gw_stickyheader_page.dart';

class GetwidgetPage extends StatelessWidget {
  const GetwidgetPage({super.key});

  List<Page> getRoutes() {
    return [
      Page("Sticky Header", const GWStickyHeaderPage()),
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
