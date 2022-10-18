import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppBarProfile extends StatefulWidget {
  const AppBarProfile({super.key});

  @override
  State<AppBarProfile> createState() => _AppBarProfileState();
}

class _AppBarProfileState extends State<AppBarProfile> {
  final _random = Random();
  final ScrollController _controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        controller: _controller,
        physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics()),
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor: context.theme.primaryColor,
            pinned: true,
            expandedHeight: 556.0 / 990.0 * context.width,
            stretch: true,
            stretchTriggerOffset: 40,
            onStretchTrigger: () async {
              // ignore: avoid_print
              print('onStretchTrigger');
            },
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                "res/images/star.png",
                fit: BoxFit.cover,
              ),
              title: const Text(
                'Profile',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
          ),
          SliverFixedExtentList(
            itemExtent: 50,
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return ListTile(
                    title: Text('${_random.nextInt(100)}'),
                    onTap: () => debugPrint('$index'));
              },
              childCount: 20,
            ),
          ),
        ],
      ),
    );
  }
}
