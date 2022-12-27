import 'package:flutter/material.dart';

import '../../framework/debug/i_log.dart';

class PageViewExample extends StatelessWidget {
  const PageViewExample({super.key});

  @override
  Widget build(BuildContext context) {

    ILog.debug("?????", "PageViewExample build");

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("PageView Example"),
        ),
        body: Container(
          alignment: Alignment.center,
          width: double.infinity,
          height: double.infinity,
          child: _ContentView(),
        ),
      ),
    );
  }
}

class _ContentView extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _ContentViewState();
  }
}

class _ContentViewState extends State<_ContentView> {

  int _currentPage = 5001;
  final double _height = 230.0;

  final List<Widget> _pageList = [
    Container(
      color: Colors.red,
      child: const Center(
        child: Text("First Page"),
      ),
    ),
    Container(
      color: Colors.green,
      child: const Center(
        child: Text('Second Page'),
      ),
    ),
    Container(
      color: Colors.blue,
      child: const Center(
        child: Text('Third Page'),
      ),
    )
  ];

  final PageController _pageController = PageController(
      initialPage: 5001,
      viewportFraction: 0.5
  );

  @override
  void initState() {
    super.initState();

    _pageController.addListener(() {

      int position = _pageController.page!.round();

      if (_currentPage != position) {
        {
          setState(() {
            _currentPage = position;
          });
        }
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return SizedBox(
      width: double.infinity,
      height: _height,
      child: PageView.builder(
        controller: _pageController,
        itemCount: 20000,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {

          bool active = index == _currentPage;
          ILog.debug("???", "_currentPage $_currentPage, active?? $active");

          // Animated Properties
          final double blur = active ? 20 : 0;
          final double offset = active ? 20 : 0;

          final double top = active ? 0 : 80;

          return AnimatedContainer(
            duration: const Duration(milliseconds: 1000),
            curve: Curves.easeOutQuint,
            margin: EdgeInsets.only(top: top, bottom: 0, right: 0),
            decoration: BoxDecoration(
                boxShadow: [BoxShadow(color: Colors.black87, blurRadius: blur, offset: Offset(offset, offset))]
            ),
            child: _pageList[index % (_pageList.length)],
          );

        },
      ),
    );
  }
}
