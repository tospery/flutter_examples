import 'package:flutter/material.dart';

import 'basic/basic.dart';
import 'utils/function.dart';
import 'widget/widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Examples',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Examples'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView(
        children: generateItem(
          context,
          [
            PageInfo("基础", (ctx) => const BasicPage()),
            PageInfo("组件", (ctx) => const WidgetPage()),
            PageInfo("事件", (ctx) => const BasicPage()),
            PageInfo("通知", (ctx) => const BasicPage()),
            PageInfo("动画", (ctx) => const BasicPage()),
            PageInfo("文件操作", (ctx) => const BasicPage()),
            PageInfo("网络请求", (ctx) => const BasicPage()),
            PageInfo("本地化", (ctx) => const BasicPage()),
            PageInfo("高级", (ctx) => const BasicPage()),
          ],
        ),
      ),
    );
  }
}
