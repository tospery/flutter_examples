import 'package:flutter/material.dart' hide Page;
import 'package:flukit/example/example.dart';

class InactionPage extends StatelessWidget {
  const InactionPage({super.key});

  List<Page> getRoutes() {
    return [
      // Page("AfterLayout", const AfterLayoutRoute(), showLog: true),
      // Page(
      //   "AccurateSizedBox",
      //   const AccurateSizedBoxRoute(),
      //   showLog: true,
      // ),
      // Page("AnimatedRotationBox", const AnimatedRotationBoxRoute()),
      // Page("DoneWidget", const DoneWidgetRoute()),
      // Page("GradientButton", const GradientButtonRoute()),
      // Page(
      //   "GradientCircularProgressIndicator",
      //   const GradientCircularProgressRoute(),
      // ),
      // Page(
      //   "KeepAlive Test",
      //   const KeepAliveTest(),
      //   padding: false,
      //   showLog: true,
      // ),
      // Page("LayoutLogPrint", const LayoutLogPrintRoute(), showLog: true),
      // Page("LeftRightBox", const LeftRightBoxRoute()),
      // Page("Log Panel", const LogListenerScopeRoute(), withScaffold: false),
      // Page(
      //   "OverflowWithTranslateBox",
      //   const OverflowWithTranslateRoute(),
      //   padding: false,
      // ),
      // Page("PullRefresh", const PullRefreshRoute(), padding: false),

      // Page("Quick Scrollbar", const QuickScrollbarRoute(), padding: false),
      // Page("Swiper", const SwiperRoute()),
      // Page("Swiper Style", const SwiperStyleRoute()),
      // Page("ScaleView", const ScaleViewRoute(), padding: false),
      // Page(
      //   "SliverFlexibleHeader",
      //   const SliverFlexibleHeaderRoute(),
      //   padding: false,
      // ),
      // Page(
      //   "SliverHeaderDelegate",
      //   const SliverHeaderDelegateRoute(),
      //   padding: false,
      // ),
      // Page(
      //   "SliverPersistentHeaderToBox",
      //   const SliverPersistentHeaderToBoxRoute(),
      //   padding: false,
      // ),
      // Page("SlideTransitionX", const SlideTransitionXRoute()),
      // Page("TurnBox", TurnBoxRoute()),
      // Page("WaterMark(水印)", const WatermarkRoute(), padding: false),
      // // Page("AzListView", (ctx) => QuickSelectListViewRoute()),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListPage(
        children: getRoutes(),
      ),
    );
  }
}
