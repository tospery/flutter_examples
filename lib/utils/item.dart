import 'package:flutter/material.dart';

class Item extends StatefulWidget {
  final String title;

  const Item({super.key, required this.title});

  @override
  // ignore: library_private_types_in_public_api
  _ItemState createState() => _ItemState();
}

class _ItemState extends State<Item> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.0,
      child: Card(
        margin: const EdgeInsets.only(
            left: 10.0, right: 10.0, top: 5.0, bottom: 5.0),
        child: Center(
          child: Text(widget.title),
        ),
      ),
    );
  }
}
