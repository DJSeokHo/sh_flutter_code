import 'package:flutter/material.dart';

import '../../framework/debug/i_log.dart';

void main() {
  runApp(const MaterialApp(home: CustomScrollItemPositionExample(),));
}

class CustomScrollItemPositionExample extends StatefulWidget {
  const CustomScrollItemPositionExample({super.key});

  @override
  State<StatefulWidget> createState() {
    return _CustomScrollItemPositionExampleState();
  }

}

class _CustomScrollItemPositionExampleState extends State<CustomScrollItemPositionExample> {

  final ScrollController _scrollController = ScrollController();

  final GlobalKey _keyRed = GlobalKey();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {

       _scrollController.addListener(() {

      double scrollPosition = _scrollController.offset;
      ILog.debug("???", "$scrollPosition");

    });

      Future.delayed(const Duration(milliseconds: 1500), () {

        final context = _keyRed.currentContext;
        if (context != null) {
          final RenderBox renderBox = context.findRenderObject() as RenderBox;
          final topLeftPosition = renderBox.localToGlobal(Offset.zero).dy;
          ILog.debug("???", "_keyRed $topLeftPosition");
        }

      },);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("app bar"),
      ),
      body: Container(
        color: Colors.white,
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: [

            CustomScrollView(
              controller: _scrollController,
              slivers: [

                SliverToBoxAdapter(
                  child: Container(
                    color: Colors.white,
                    width: double.infinity,
                    height: 700,
                  ),
                ),

                SliverToBoxAdapter(
                  child: Container(
                    key: _keyRed,
                    color: Colors.red,
                    width: double.infinity,
                    height: 700,
                  ),
                ),

                SliverToBoxAdapter(
                  child: Container(
                    color: Colors.grey,
                    width: double.infinity,
                    height: 300,
                  ),
                ),

                SliverToBoxAdapter(
                  child: Container(
                    color: Colors.green,
                    width: double.infinity,
                    height: 600,
                  ),
                ),

                SliverToBoxAdapter(
                  child: Container(
                    color: Colors.blue,
                    width: double.infinity,
                    height: 500,
                  ),
                ),
              ],
            )

          ],
        ),
      ),
    );
  }

}