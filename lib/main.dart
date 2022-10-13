import 'dart:async';
import 'package:flukit/flukit.dart';
import 'package:flutter/material.dart' hide Page;
import 'package:flukit/example/example.dart';
import 'getwidget/getwidget_page.dart';
import 'inaction/inaction_page.dart';
import 'open/open_page.dart';

void main() {
  final logEmitter = getGlobalLogEmitter();
  runZoned(
    () => runApp(const MyApp()),
    zoneSpecification: ZoneSpecification(
      print: (Zone self, ZoneDelegate parent, Zone zone, String line) {
        parent.print(zone, line);
        // Intercept `print` function and redirect log.
        logEmitter.value = LogInfo(false, line);
      },
      handleUncaughtError: (Zone self, ZoneDelegate parent, Zone zone,
          Object error, StackTrace stackTrace) {
        parent.print(zone, '${error.toString()} $stackTrace');
        // Redirect error log event when error.
        logEmitter.value = LogInfo(true, error.toString());
      },
    ),
  );

  var onError = FlutterError.onError;
  FlutterError.onError = (FlutterErrorDetails details) {
    onError?.call(details);
    // Redirect error log event when error.
    logEmitter.value = LogInfo(true, details.toString());
  };
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final routesMap = mapRoutes(getRoutes());
      return MaterialApp(
        title: 'Examples',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routes: routesMap,
        onGenerateRoute: (RouteSettings settings) {
          String routeName = settings.name!.substring(1).toLowerCase();
          routeName = Uri.decodeComponent(routeName);
          return MaterialPageRoute(
            builder: routesMap[routeName] ??
                (context) => const MyHomePage(title: 'Flutter Examples'),
          );
        },
        home: const MyHomePage(title: 'Flutter Examples'),
      );
    });
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  // ignore: library_private_types_in_public_api
  _MyHomePageState createState() => _MyHomePageState();
}

//防止热更新失效，我们不定义为静态变量
List<Page> getRoutes() {
  return [
    Page("Flutter实战（第二版）", const InactionPage()),
    Page("GetWidget教程", const GetwidgetPage()),
    Page("开源项目", const OpenPage()),
  ];
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: ListPage(
        children: getRoutes(),
      ),
    );
  }
}

Map<String, WidgetBuilder> mapRoutes(List<Page> pages) {
  return pages.fold(<String, WidgetBuilder>{}, (pre, page) {
    pre[page.title.toLowerCase()] = page.build;
    return pre;
  });
}
