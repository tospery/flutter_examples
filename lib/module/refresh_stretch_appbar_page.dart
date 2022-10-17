import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:draggable_home/draggable_home.dart';

// 缺少刷新
class RefreshStretchAppbarPage extends StatefulWidget {
  const RefreshStretchAppbarPage({super.key});

  @override
  State<RefreshStretchAppbarPage> createState() =>
      _RefreshStretchAppbarPageState();
}

class _RefreshStretchAppbarPageState extends State<RefreshStretchAppbarPage> {
  @override
  Widget build(BuildContext context) {
    return DraggableHome(
      // leading: const Icon(Icons.arrow_back_ios),
      leading: Container(),
      title: const Text("Profile"),
      headerWidget: headerWidget(context),
      body: [
        listView(),
      ],
      curvedBodyRadius: 0,
      backgroundColor: context.theme.primaryColor,
      appBarColor: context.theme.primaryColor,
      // stretchTriggerOffset: 100,
      // fullyStretchable: true,
      headerExpandedHeight: 245.0 / 460.0 * context.width / context.height,
    );
  }

  Row headerBottomBarWidget() {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: const [
        Icon(
          Icons.settings,
          color: Colors.white,
        ),
      ],
    );
  }

  Widget headerWidget(BuildContext context) {
    // return Container(
    //   color: Colors.red,
    //   child: Center(
    //     child: Text(
    //       "Title",
    //       // style: Theme.of(context)
    //       //     .textTheme
    //       //     .headline2!
    //       //     .copyWith(color: Colors.white70),
    //     ),
    //   ),
    // );
    return Image.asset(
      "res/images/sea.png",
      fit: BoxFit.fill,
    );
  }

  ListView listView() {
    return ListView.builder(
      padding: const EdgeInsets.only(top: 0),
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 20,
      shrinkWrap: true,
      itemBuilder: (context, index) => Card(
        color: Colors.white70,
        child: ListTile(
          leading: CircleAvatar(
            child: Text("$index"),
          ),
          title: const Text("Title"),
          subtitle: const Text("Subtitile"),
        ),
      ),
    );
  }

  // final _random = Random();
  // final int _itemCount = 20;
  // final ScrollController _controller = ScrollController();

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     body: CustomScrollView(
  //       controller: _controller,
  //       physics: const BouncingScrollPhysics(
  //           parent: AlwaysScrollableScrollPhysics()),
  //       slivers: <Widget>[
  //         SliverAppBar(
  //           backgroundColor: context.theme.primaryColor,
  //           pinned: true,
  //           stretch: true,
  //           // elevation: 10.0,
  //           // forceElevated: true,
  //           expandedHeight: context.width / 460.0 * 245.0,
  //           flexibleSpace: FlexibleSpaceBar(
  //             stretchModes: const [
  //               StretchMode.zoomBackground,
  //               StretchMode.fadeTitle,
  //             ],
  //             background: Image.asset(
  // "res/images/sea.png",
  // fit: BoxFit.fill,
  //             ),
  //             centerTitle: false,
  //             title: const Text(
  //               'Profile',
  //               style: TextStyle(fontSize: 20, color: Colors.white),
  //             ),
  //             expandedTitleScale: 1.5,
  //             titlePadding: EdgeInsetsDirectional.only(start: 0, bottom: 0),
  //           ),
  //         ),
  //         SliverFixedExtentList(
  //           itemExtent: 50,
  //           delegate: SliverChildBuilderDelegate(
  //             (context, index) {
  //               return ListTile(
  //                   title: Text('${_random.nextInt(100)}'),
  //                   onTap: () => debugPrint('$index'));
  //             },
  //             childCount: _itemCount,
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }
}

// class RefreshStretchAppbarPage extends StatefulWidget {
//   const RefreshStretchAppbarPage({super.key});

//   @override
//   State<StatefulWidget> createState() {
//     return _RefreshStretchAppbarPageState();
//   }
// }

// class _RefreshStretchAppbarPageState extends State<RefreshStretchAppbarPage> {
//   final RefreshController _refreshController = RefreshController();
//   final Key linkKey = GlobalKey();
//   List<String> data = ["1", "2", "3", "4", "5", "6", "7", "8", "9"];
//   final ScrollController _scrollController = ScrollController();
//   bool dismissAppbar = false;

//   @override
//   void initState() {
//     _scrollController.addListener(() {
//       final bool ifdismissAppbar = _scrollController.offset >= 136.0;
//       if (dismissAppbar != ifdismissAppbar) {
//         if (mounted) setState(() {});
//       }
//       dismissAppbar = ifdismissAppbar;
//     });
//     super.initState();
//   }

//   @override
//   void dispose() {
//     _refreshController.dispose();
//     _scrollController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return RefreshConfiguration.copyAncestor(
//       context: context,
//       maxOverScrollExtent: 100,
//       child: Scaffold(
//         body: Stack(
//           children: <Widget>[
//             Stack(
//               children: <Widget>[
//                 Positioned(
//                   top: 0.0,
//                   bottom: 0.0,
//                   left: 0.0,
//                   right: 0.0,
//                   child: SmartRefresher(
//                     controller: _refreshController,
//                     header: LinkHeader(linkKey: linkKey),
//                     onRefresh: () async {
//                       await Future.delayed(const Duration(milliseconds: 3000));
//                       _refreshController.refreshCompleted();
//                     },
//                     child: CustomScrollView(
//                       controller: _scrollController,
//                       slivers: <Widget>[
//                         SliverToBoxAdapter(
                          // child: Image.asset(
                          //   "res/images/sea.png",
                          //   fit: BoxFit.fill,
                          //   height: context.width / 460.0 * 245.0,
                          // ),
//                         ),
//                         SliverFixedExtentList(
//                           delegate: SliverChildBuilderDelegate(
//                               (c, i) => Item(
//                                     title: data[i],
//                                   ),
//                               childCount: data.length),
//                           itemExtent: 100.0,
//                         )
//                       ],
//                     ),
//                   ),
//                 )
//               ],
//             ),
//             SizedBox(
//               height: context.mediaQueryPadding.top + 64,
//               child: AppBar(
//                 backgroundColor:
//                     dismissAppbar ? Colors.blueAccent : Colors.transparent,
//                 elevation: dismissAppbar ? 1.0 : 0.0,
//                 title: SimpleLinkBar(
//                   key: linkKey,
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class SimpleLinkBar extends StatefulWidget {
//   const SimpleLinkBar({required Key key}) : super(key: key);

//   @override
//   State<StatefulWidget> createState() {
//     return _SimpleLinkBarState();
//   }
// }

// class _SimpleLinkBarState extends State<SimpleLinkBar>
//     with RefreshProcessor, SingleTickerProviderStateMixin {
//   RefreshStatus _status = RefreshStatus.idle;
//   late AnimationController _animationController;

//   @override
//   void dispose() {
//     super.dispose();
//   }

//   @override
//   void initState() {
//     _animationController = AnimationController(vsync: this);
//     super.initState();
//   }

//   @override
//   Future endRefresh() {
//     _animationController.animateTo(0.0,
//         duration: const Duration(milliseconds: 300));
//     return Future.value();
//   }

//   @override
//   void onOffsetChange(double offset) {
//     if (_status != RefreshStatus.refreshing) {
//       _animationController.value = offset / 80.0;
//     }
//     super.onOffsetChange(offset);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return ScaleTransition(
//       scale: _animationController,
//       child: const CupertinoActivityIndicator(),
//     );
//   }

//   @override
//   void onModeChange(RefreshStatus? mode) {
//     super.onModeChange(mode);
//     if (mode != null) {
//       _status = mode;
//     }
//     setState(() {});
//   }
// }
