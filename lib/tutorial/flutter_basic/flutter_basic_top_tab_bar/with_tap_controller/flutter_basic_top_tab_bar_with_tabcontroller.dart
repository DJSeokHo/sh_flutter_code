
import 'package:flutter/material.dart';

import '../../../../framework/debug/i_log.dart';

const _tag = "FlutterBasicTopTabBarWithTapController";

class FlutterBasicTopTabBarWithTapController extends StatefulWidget {
  const FlutterBasicTopTabBarWithTapController({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ContentView();
  }

}

class _ContentView extends State<StatefulWidget> with SingleTickerProviderStateMixin { // with 多继承

  late TabController _tabController;

  /// 生命周期函数 生成
  @override
  void initState() {
    super.initState();

    _tabController = TabController(
        length: 2,
        vsync: this // 类似苹果的 delegate 或者 接口
    );

    _tabController.addListener(() {
      ILog.debug(_tag, "${_tabController.index}");

    });
  }

  /// 生命周期函数 销毁
  @override
  void dispose() {
    super.dispose();

    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("TabController Example"),
          bottom: TabBar(
            controller: _tabController,
            tabs: const [
              Tab(
                text: "Hot",
              ),
              Tab(
                text: "New",
              )
            ],
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: const [
            Center(
              child: Text("Hot"),
            ),
            Center(
              child: Text("New"),
            )
          ],
        ),
      ),
    );
  }

}