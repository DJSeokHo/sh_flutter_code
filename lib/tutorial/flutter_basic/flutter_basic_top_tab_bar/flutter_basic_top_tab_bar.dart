import 'package:flutter/material.dart';
import '../../../framework/debug/i_log.dart';

void main() {
  runApp(const FlutterBasicTopTabBarView());
}

const _tag = "FlutterBasicTopTabBarView";

class FlutterBasicTopTabBarView extends StatelessWidget {
  const FlutterBasicTopTabBarView({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController( // 需要顶部 tab 的话，需要这个作为外层组件
        length: 2,
        child: _ContentView(),
      )
    );
  }
}

class _ContentView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold( // Scaffold 可以 嵌套 Scaffold
      appBar: AppBar(
        title: const Text("AppBar Example"),
        centerTitle: true, // 无论在什么机器上，标题都居中显示
        backgroundColor: Colors.deepOrange,
        // leading: const Icon(Icons.menu), // Icon 无法点击
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {
            ILog.debug(_tag, "menu");
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              ILog.debug(_tag, "settings");
            },
          ),
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              ILog.debug(_tag, "add");
            },
          ),
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              ILog.debug(_tag, "search");
            },
          ),
        ],
        bottom: const TabBar(
          indicatorColor: Colors.white,
          // isScrollable: true,
          // indicatorWeight: 20,
          // indicatorPadding: EdgeInsets.fromLTRB(20, 0, 20, 0),
          // indicatorSize: TabBarIndicatorSize.label, // 跟随文字的长度
          labelColor: Colors.white,
          unselectedLabelColor: Colors.grey,
          tabs: [
            Tab(
              text: "hot",
            ),
            Tab(
              text: "new",
            )
          ],
        ), // 顶部 tab bar
      ),
      body: TabBarView(
        children: [

          ListView(
            children: const [
              ListTile(
                title: Text("title 1"),
                subtitle: Text("sub title"),
              ),
              ListTile(
                title: Text("title 1"),
                subtitle: Text("sub title"),
              ),
              ListTile(
                title: Text("title 1"),
                subtitle: Text("sub title"),
              )
            ],
          ),

          ListView(
            children: const [
              ListTile(
                title: Text("title 2"),
                subtitle: Text("sub title"),
              ),
              ListTile(
                title: Text("title 2"),
                subtitle: Text("sub title"),
              ),
              ListTile(
                title: Text("title 2"),
                subtitle: Text("sub title"),
              )
            ],
          )

        ],
      ),
    );
  }
}

