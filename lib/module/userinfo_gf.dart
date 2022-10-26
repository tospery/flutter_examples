import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

class UserinfoGFPage extends StatefulWidget {
  const UserinfoGFPage({super.key});

  @override
  State<UserinfoGFPage> createState() => _UserinfoGFPageState();
}

class _UserinfoGFPageState extends State<UserinfoGFPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: const Text('GFListTile'),
      ),
      body: ListView.separated(
        itemCount: 5,
        itemBuilder: (BuildContext context, int index) {
          return GFListTile(
            // color: GFColors.PRIMARY,
            titleText: '$index',
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 0),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return const Divider(
            color: Colors.red,
            height: 0,
          );
        },
      ),
    );
  }
}
