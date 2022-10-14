import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_examples/utils/item.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class RefreshStretchAppbarPage extends StatefulWidget {
  const RefreshStretchAppbarPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _RefreshStretchAppbarPageState();
  }
}

class _RefreshStretchAppbarPageState extends State<RefreshStretchAppbarPage> {
  final RefreshController _refreshController = RefreshController();
  final Key linkKey = GlobalKey();
  List<String> data = ["1", "2", "3", "4", "5", "6", "7", "8", "9"];
  final ScrollController _scrollController = ScrollController();
  bool dismissAppbar = false;

  @override
  void initState() {
    _scrollController.addListener(() {
      final bool ifdismissAppbar = _scrollController.offset >= 136.0;
      if (dismissAppbar != ifdismissAppbar) {
        if (mounted) setState(() {});
      }
      dismissAppbar = ifdismissAppbar;
    });
    super.initState();
  }

  @override
  void dispose() {
    _refreshController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshConfiguration.copyAncestor(
      context: context,
      maxOverScrollExtent: 100,
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Positioned(
                  top: -150.0,
                  bottom: 0.0,
                  left: 0.0,
                  right: 0.0,
                  child: SmartRefresher(
                    controller: _refreshController,
                    header: LinkHeader(linkKey: linkKey),
                    onRefresh: () async {
                      await Future.delayed(const Duration(milliseconds: 3000));
                      _refreshController.refreshCompleted();
                    },
                    child: CustomScrollView(
                      controller: _scrollController,
                      slivers: <Widget>[
                        SliverToBoxAdapter(
                          child: Image.asset(
                            "res/images/qqbg.jpg",
                            fit: BoxFit.fill,
                            height: 300.0,
                          ),
                        ),
                        SliverFixedExtentList(
                          delegate: SliverChildBuilderDelegate(
                              (c, i) => Item(
                                    title: data[i],
                                  ),
                              childCount: data.length),
                          itemExtent: 100.0,
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 64.0,
              child: AppBar(
                backgroundColor:
                    dismissAppbar ? Colors.blueAccent : Colors.transparent,
                elevation: dismissAppbar ? 1.0 : 0.0,
                title: SimpleLinkBar(
                  key: linkKey,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class SimpleLinkBar extends StatefulWidget {
  const SimpleLinkBar({required Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _SimpleLinkBarState();
  }
}

class _SimpleLinkBarState extends State<SimpleLinkBar>
    with RefreshProcessor, SingleTickerProviderStateMixin {
  RefreshStatus _status = RefreshStatus.idle;
  late AnimationController _animationController;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    _animationController = AnimationController(vsync: this);
    super.initState();
  }

  @override
  Future endRefresh() {
    _animationController.animateTo(0.0,
        duration: const Duration(milliseconds: 300));
    return Future.value();
  }

  @override
  void onOffsetChange(double offset) {
    if (_status != RefreshStatus.refreshing) {
      _animationController.value = offset / 80.0;
    }
    super.onOffsetChange(offset);
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _animationController,
      child: const CupertinoActivityIndicator(),
    );
  }

  @override
  void onModeChange(RefreshStatus? mode) {
    super.onModeChange(mode);
    if (mode != null) {
      _status = mode;
    }
    setState(() {});
  }
}