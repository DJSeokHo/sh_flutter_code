// import 'dart:html';
// import 'dart:io';

import 'package:flutter/material.dart';
import 'package:sh_flutter_code/dart/dart_test.dart';
import 'package:sh_flutter_code/tutorial/flutter_basic/flutter_basic_01.dart';
import 'package:sh_flutter_code/tutorial/flutter_basic/flutter_basic_02.dart';
import 'package:sh_flutter_code/tutorial/flutter_basic/flutter_basic_aspectratio.dart';
import 'package:sh_flutter_code/tutorial/flutter_basic/flutter_basic_buttons.dart';
import 'package:sh_flutter_code/tutorial/flutter_basic/flutter_basic_drawer/flutter_basic_drawer.dart';
import 'package:sh_flutter_code/tutorial/flutter_basic/flutter_basic_navigator/flutter_basic_simple_navigator.dart';
import 'package:sh_flutter_code/tutorial/flutter_basic/flutter_basic_navigator_with_replace_routes/flutter_basic_navigator_with_replace_routes_main.dart';
import 'package:sh_flutter_code/tutorial/flutter_basic/flutter_basic_navigator_with_routes/flutter_basic_navigator_with_routes_main.dart';
import 'package:sh_flutter_code/tutorial/flutter_basic/flutter_basic_system_bottom_navigation/flutter_basic_system_bottom_navigation.dart';
import 'package:sh_flutter_code/tutorial/flutter_basic/flutter_basic_card.dart';
import 'package:sh_flutter_code/tutorial/flutter_basic/flutter_basic_column.dart';
import 'package:sh_flutter_code/tutorial/flutter_basic/flutter_basic_container.dart';
import 'package:sh_flutter_code/tutorial/flutter_basic/flutter_basic_dynamic_list.dart';
import 'package:sh_flutter_code/tutorial/flutter_basic/flutter_basic_expanded.dart';
import 'package:sh_flutter_code/tutorial/flutter_basic/flutter_basic_grid.dart';
import 'package:sh_flutter_code/tutorial/flutter_basic/flutter_basic_image.dart';
import 'package:sh_flutter_code/tutorial/flutter_basic/flutter_basic_list.dart';
import 'package:sh_flutter_code/tutorial/flutter_basic/flutter_basic_padding.dart';
import 'package:sh_flutter_code/tutorial/flutter_basic/flutter_basic_row.dart';
import 'package:sh_flutter_code/tutorial/flutter_basic/flutter_basic_stack.dart';
import 'package:sh_flutter_code/tutorial/flutter_basic/flutter_basic_stateful.dart';
import 'package:sh_flutter_code/tutorial/flutter_basic/flutter_basic_top_tab_bar/flutter_basic_top_tab_bar.dart';
import 'package:sh_flutter_code/tutorial/flutter_basic/flutter_basic_top_tab_bar/top_tab_bar_and_bottom_navigation_bar/flutter_basic_top_tab_bar_and_bottom_navigation_bar.dart';
import 'package:sh_flutter_code/tutorial/flutter_basic/flutter_basic_top_tab_bar/with_tap_controller/flutter_basic_top_tab_bar_with_tabcontroller.dart';
import 'package:sh_flutter_code/tutorial/flutter_basic/flutter_basic_wrap.dart';

import 'framework/debug/i_log.dart';

const _tag = "Main";

void main() {

  // device info, only for not web
  // if(Platform.isAndroid) {
  //   // Android
  //   ILog.debug(_tag, "Android");
  // }
  // else if(Platform.isIOS) {
  //   // IOS
  //   ILog.debug(_tag, "iOS");
  // }
  // else if(Platform.isFuchsia) {
  //   // Fuchsia
  //   ILog.debug(_tag, "Fuchsia");
  // }
  // else if(Platform.isWindows) {
  //   // Windows
  //   ILog.debug(_tag, "Window");
  // }
  // else if(Platform.isMacOS) {
  //   // MacOS
  //   ILog.debug(_tag, "Mac");
  // }
  // else if(Platform.isLinux) {
  //   // Linux
  //   ILog.debug(_tag, "Linux");
  // }

  // disable web right click only for web
  // window.document.onContextMenu.listen((evt) => evt.preventDefault());

  // runApp(const FlutterBasic01());
  // runApp(const FlutterBasic02());
  // runApp(const ContainerDemoView());
  // runApp(const FlutterBasicImageView());
  // runApp(const FlutterBasicListView());
  // runApp(const FlutterBasicDynamicListView());
  // runApp(const FlutterBasicGridView());
  // runApp(const FlutterBasicPaddingExample());
  // runApp(const FlutterBasicRowExample());
  // runApp(const FlutterBasicColumnExample());
  // runApp(const FlutterBasicExpandedExample());
  // runApp(const FlutterBasicStack());
  // runApp(const FlutterBasicAspectRatioExample());
  // runApp(const FlutterBasicCardExample());
  // runApp(const FlutterBasicWrapExample());
  // runApp(const FlutterBasicStatefulExample());
  // runApp(const FlutterBasicSystemBottomNavigationBarExample());
  // runApp(const FlutterBasicSimpleNavigator());
  // runApp(const FlutterBasicNavigatorWithRoutesMain());
  // runApp(const FBNWRRMainApp());
  // runApp(const FlutterBasicTopTabBarView());
  // runApp(const FlutterBasicTopTabBarAndBottomNavigationBar());
  // runApp(const FlutterBasicTopTabBarWithTapController());
  // runApp(const FlutterBasicDrawer());
  runApp(const FlutterBasicButtons());

  // runApp(const MyApp());

  // DartTest dartTest = DartTest();
  //
  // dartTest.helloWorld();
  // dartTest.greeting("Seok Ho");
  //
  // dartTest.iParameter();
  // dartTest.iiCollection();
  // dartTest.iiiConditionControl();
  // dartTest.ivFunction();
  // dartTest.vClass();
  // dartTest.viAbstractClass();
  // dartTest.viiInterface();
  //
  // dartTest.fetchDataTest();
}

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blueGrey,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
