import 'package:flutter/material.dart';

void openPage(BuildContext context, PageInfo page) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) {
        if (!page.withScaffold) {
          return page.builder(context);
        }
        return PageScaffold(
          title: page.title,
          body: page.builder(context),
          padding: page.padding,
        );
      },
    ),
  );
}

List<Widget> generateItem(BuildContext context, List<PageInfo> children) {
  return children.map<Widget>((page) {
    return ListTile(
      title: Text(page.title),
      trailing: const Icon(Icons.keyboard_arrow_right),
      onTap: () => openPage(context, page),
    );
  }).toList();
}

class PageInfo {
  PageInfo(
    this.title,
    this.builder, {
    this.withScaffold = true,
    this.padding = false,
  });

  String title;
  WidgetBuilder builder;
  bool withScaffold;
  bool padding;
}

class PageScaffold extends StatelessWidget {
  const PageScaffold({
    Key? key,
    required this.title,
    required this.body,
    required this.padding,
  }) : super(key: key);

  final String title;
  final Widget body;
  final bool padding;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: padding
          ? Padding(
              padding: const EdgeInsets.all(16.0),
              child: body,
            )
          : body,
    );
  }
}
