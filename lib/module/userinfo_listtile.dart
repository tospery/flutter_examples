import 'package:flutter/material.dart';

class UserinfoListTile extends StatefulWidget {
  const UserinfoListTile({super.key});

  @override
  State<UserinfoListTile> createState() => _UserinfoListTileState();
}

class _UserinfoListTileState extends State<UserinfoListTile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: const Text('ListTile'),
      ),
      body: ListView.separated(
        itemCount: 5,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            color: Colors.green,
            height: 40,
            child: Center(
              child: ListTile(
                title: Text("$index"),
              ),
            ),
          );
          // return ListTile(
          //     title: Text("$index"),
          //     // isThreeLine: false,
          // );
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
