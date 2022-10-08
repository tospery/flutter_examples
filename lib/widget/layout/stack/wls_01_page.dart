import 'package:flutter/material.dart';

class Wls01Page extends StatefulWidget {
  const Wls01Page({super.key});

  @override
  State<Wls01Page> createState() => _Wls01PageState();
}

class _Wls01PageState extends State<Wls01Page> {
  @override
  Widget build(BuildContext context) {
    //通过ConstrainedBox来确保Stack占满屏幕
    return ConstrainedBox(
      constraints: const BoxConstraints.expand(),
      child: Stack(
        alignment: Alignment.center, //指定未定位或部分定位widget的对齐方式
        children: <Widget>[
          Container(
            color: Colors.red,
            child: const Text("Hello world",
                style: TextStyle(color: Colors.white)),
          ),
          const Positioned(
            left: 18.0,
            child: Text("I am Jack"),
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
