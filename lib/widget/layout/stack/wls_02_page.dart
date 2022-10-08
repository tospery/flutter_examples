import 'package:flutter/material.dart';

class Wls02Page extends StatefulWidget {
  const Wls02Page({super.key});

  @override
  State<Wls02Page> createState() => _Wls02PageState();
}

class _Wls02PageState extends State<Wls02Page> {
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints.expand(),
      child: Stack(
        alignment: Alignment.center,
        fit: StackFit.expand, //未定位widget占满Stack整个空间
        children: <Widget>[
          const Positioned(
            left: 18.0,
            child: Text("I am Jack"),
          ),
          Container(
            color: Colors.red,
            child: const Text("Hello world", style: TextStyle(color: Colors.white)),
          ),
          const Positioned(
            top: 18.0,
            child: Text("Your friend"),
          )
        ],
      ),
    );
  }
}
