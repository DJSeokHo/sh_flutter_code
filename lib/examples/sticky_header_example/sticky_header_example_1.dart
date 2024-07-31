import 'package:flutter/material.dart';

import '../../framework/debug/i_log.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: _HomePage(),
    );
  }
}

class _HomePage extends StatefulWidget {
  const _HomePage();

  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<_HomePage> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final ScrollController _scrollController = ScrollController();

  bool _isTabBarPinned = false;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    _scrollController.addListener(_handleScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_handleScroll);
    _scrollController.dispose();
    _tabController.dispose();
    super.dispose();
  }

  void _handleScroll() {
    if (!_scrollController.hasClients) {
      return;
    }

    final scrollOffset = _scrollController.offset;

    // Calculate new pinning states
    final isTabBarPinned = scrollOffset >= 1059;
    ILog.debug("???", "scrollOffset $scrollOffset >= 1059");
    // Only update state if there's a change
    if (isTabBarPinned) {
      ILog.debug("?????", "!!!! isTabBarPinned $isTabBarPinned");
      if (!_isTabBarPinned) {
        setState(() {
          _isTabBarPinned = true;
        });
      }
    }
    else {
      if (_isTabBarPinned) {
        setState(() {
          _isTabBarPinned = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("app bar"),
      ),
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverAppBar(
            expandedHeight: 700,
            flexibleSpace: Container(
              width: double.infinity,
              height: double.infinity,
              color: Colors.red,
              child: const Center(
                child: Text("header"),
              ),
            ),
          ),

          SliverFillRemaining(
            // Fill the remaining height
            child: Container(
              color: Colors.white,
              width: double.infinity,
              height: double.infinity,
              child: DefaultTabController(
                length: 8,
                child:  Scaffold(
                  appBar: TabBar(
                    controller: _tabController,
                    dividerHeight: 0,
                    dividerColor: Colors.black,
                    indicatorSize: TabBarIndicatorSize.label,
                    indicatorPadding: const EdgeInsets.symmetric(horizontal: 0),
                    indicatorWeight: 2,
                    indicatorColor: Colors.black,
                    unselectedLabelColor: Colors.grey,
                    tabs: const [

                      Tab(text: "1"),
                      Tab(text: "2"),
                      Tab(text: "3"),
                      Tab(text: "4"),

                    ],
                    isScrollable: true, // 是否自动填充空间
                    labelColor: Colors.black,
                    tabAlignment: TabAlignment.start,
                  ),
                  backgroundColor: Colors.white,
                  body: Stack(
                    children: [
                      TabBarView(
                        controller: _tabController,
                        children: [
                          CustomScrollView(
                            physics: true ? const ClampingScrollPhysics() : const NeverScrollableScrollPhysics(),
                            slivers: [
                              SliverList(
                                delegate: SliverChildBuilderDelegate(
                                  (context, index) => ListTile(
                                    title: Text('Tab 1 Item $index'),
                                  ),
                                  childCount: 50,
                                ),
                              ),
                            ],
                          ),
                          CustomScrollView(
                            physics: true ? const ClampingScrollPhysics() : const NeverScrollableScrollPhysics(),
                            slivers: [
                              SliverList(
                                delegate: SliverChildBuilderDelegate(
                                  (context, index) => ListTile(
                                    title: Text('Tab 2 Item $index'),
                                  ),
                                  childCount: 50,
                                ),
                              ),
                            ],
                          ),
                          CustomScrollView(
                            physics: true ? const ClampingScrollPhysics() : const NeverScrollableScrollPhysics(),
                            slivers: [
                              SliverList(
                                delegate: SliverChildBuilderDelegate(
                                  (context, index) => ListTile(
                                    title: Text('Tab 3 Item $index'),
                                  ),
                                  childCount: 50,
                                ),
                              ),
                            ],
                          ),
                          CustomScrollView(
                            physics: true ? const ClampingScrollPhysics() : const NeverScrollableScrollPhysics(),
                            slivers: [
                              SliverList(
                                delegate: SliverChildBuilderDelegate(
                                  (context, index) => ListTile(
                                    title: Text('Tab 4 Item $index'),
                                  ),
                                  childCount: 50,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: _isTabBarPinned ? FloatingActionButton(
        onPressed: () {
          _scrollController.animateTo(0, duration: const Duration(milliseconds: 500), curve: Curves.fastEaseInToSlowEaseOut);
        },
        child: const Icon(Icons.keyboard_arrow_up),
      ) : null,
    );
  }
}

class TestTabViewDelegate extends SliverPersistentHeaderDelegate {
  final TabController tabController;

  TestTabViewDelegate({required this.tabController});

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Colors.blue,
      height: 60,
      child: TabBar(
        controller: tabController,
        tabs: const [
          Tab(text: 'Tab 1'),
          Tab(text: 'Tab 2'),
          Tab(text: 'Tab 3'),
          Tab(text: 'Tab 4'),
        ],
      ),
    );
  }

  @override
  double get maxExtent => 60;

  @override
  double get minExtent => 60;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}

class TestDelegate extends SliverPersistentHeaderDelegate {
  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Colors.red,
      width: double.infinity,
      height: 1000,
      child: const Center(
        child: Text("header"),
      ),
    );
  }

  @override
  double get maxExtent => 1000;

  @override
  double get minExtent => 1000;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}

class _PagerItem extends StatefulWidget {

  final bool isTabBarPinned;
  final int index;

  const _PagerItem({required this.isTabBarPinned, required this.index});

  @override
  State<StatefulWidget> createState() {
    return _PagerItemState();
  }
}

class _PagerItemState extends State<_PagerItem> {

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: widget.isTabBarPinned ? const ClampingScrollPhysics() : const NeverScrollableScrollPhysics(),
      slivers: [
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) => ListTile(
              title: Text('Tab ${widget.index} Item $index'),
            ),
            childCount: 50,
          ),
        ),
      ],
    );
  }
}
