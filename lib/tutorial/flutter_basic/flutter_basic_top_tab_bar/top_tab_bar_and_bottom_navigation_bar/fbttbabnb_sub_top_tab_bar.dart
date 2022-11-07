
import 'package:flutter/material.dart';

import '../../../../framework/debug/i_log.dart';

const _tag = "FBTTBABMBSubTopTabBar";

class FBTTBABMBSubTopTabBar extends StatelessWidget {
  const FBTTBABMBSubTopTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold( // Scaffold 可以 嵌套 Scaffold
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
      ),
    );
  }
}