import 'package:flutter/material.dart';

class Wsc01Page extends StatefulWidget {
  const Wsc01Page({super.key});

  @override
  State<Wsc01Page> createState() => _Wsc01PageState();
}

class _Wsc01PageState extends State<Wsc01Page> {
  @override
  Widget build(BuildContext context) {
    var listView = ListView.builder(
      itemCount: 20,
      itemBuilder: (_, index) => ListTile(title: Text('$index')),
    );
    return Column(
      children: [
        Expanded(child: listView),
        const Divider(color: Colors.grey),
        Expanded(child: listView),
      ],
    );
  }
}
