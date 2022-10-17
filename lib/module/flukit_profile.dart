import 'package:flukit/flukit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_examples/core/function.dart';
import 'package:get/get.dart';

class FlukitProfile extends StatefulWidget {
  const FlukitProfile({super.key});

  @override
  State<FlukitProfile> createState() => _FlukitProfileState();
}

class _FlukitProfileState extends State<FlukitProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics()),
        slivers: [
          SliverFlexibleHeader(
            visibleExtent: 556.0 / 990.0 * context.width,
            builder: (context, availableHeight, direction) {
              return GestureDetector(
                onTap: () => debugPrint('tap'),
                child: LayoutBuilder(builder: (context, cons) {
                  return Image(
                    image: const AssetImage("res/images/star.png"),
                    height: availableHeight,
                    alignment: Alignment.bottomCenter,
                    fit: BoxFit.cover,
                  );
                }),
              );
            },
          ),
          randomSliverList(30),
        ],
      ),
    );
  }
}
