import 'dart:math';
import 'package:flutter/material.dart';

Widget randomSliverList([int count = 5]) {
  return SliverFixedExtentList(
    itemExtent: 50,
    delegate: SliverChildBuilderDelegate(
      (context, index) {
        return ListTile(
            title: Text('$index -> ${Random().nextInt(100)}'),
            // ignore: avoid_print
            onTap: () => print(index));
      },
      childCount: count,
    ),
  );
}
