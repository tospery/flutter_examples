import 'dart:async';
import 'package:flukit/flukit.dart';
import 'package:flutter/material.dart' hide Page;
import 'package:flukit/example/example.dart';
import 'package:flutter_examples/module/appbar_profile.dart';
import 'package:flutter_examples/module/flukit_profile.dart';
import 'package:flutter_examples/module/refresh_stretch_appbar_page.dart';
import 'package:flutter_examples/module/userinfo_gf.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'module/userinfo_listtile.dart';

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

      return RefreshConfiguration(
        footerTriggerDistance: 15,
        dragSpeedRatio: 0.91,
        headerBuilder: () => const MaterialClassicHeader(),
        footerBuilder: () => const ClassicFooter(),
        enableLoadingWhenNoData: false,
        enableRefreshVibrate: false,
        enableLoadMoreVibrate: false,
        shouldFooterFollowWhenNotFull: (state) {
          // If you want load more with noMoreData state ,may be you should return false
          return false;
        },
        child: MaterialApp(
          title: 'Examples',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          localizationsDelegates: const [
            RefreshLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate
          ],
          supportedLocales: const [
            Locale('zh', 'CN'),
            Locale('en', 'US'),
          ],
          locale: const Locale('zh', 'CN'),
          localeListResolutionCallback: (locales, supported) {
            for (var loc in locales ?? []) {
              for (var spt in supported) {
                if (spt.languageCode == loc.languageCode) return spt;
              }
            }
            return const Locale('zh', 'CN');
          },
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
        ),
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
    Page(
      "下拉刷新+下拉缩放+上滚导航",
      const RefreshStretchAppbarPage(),
      withScaffold: false,
    ),
    Page(
      "Profile（Flukit）",
      const FlukitProfile(),
      withScaffold: false,
    ),
    Page(
      "Profile（AppBar）",
      const AppBarProfile(),
      withScaffold: false,
    ),
    Page(
      'Userinfo(ListTile)',
      const UserinfoListTile(),
      withScaffold: false,
      padding: false,
    ),
        Page(
      'Userinfo(GF)',
      const UserinfoGFPage(),
      withScaffold: false,
      padding: false,
    ),
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
