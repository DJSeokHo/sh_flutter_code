import 'package:flutter/material.dart';

// --web-hostname 192.168.0.4 --web-port 8081
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
  // runApp(const FlutterBasicButtons());
  // runApp(const FlutterBasicTextField());
  // runApp(const FlutterBasicSignInUI());
  // runApp(const FlutterBasicCheckBox());
  // runApp(const FlutterBasicCheckBoxListItem());
  // runApp(const FlutterBasicRadio());
  // runApp(const FlutterBasicSwitch());
  // runApp(const FlutterBasicSystemDatePicker());
  // runApp(const FlutterBasicSwiper());
  // runApp(const FlutterBasicDialog());
  // runApp(const FlutterBasicCustomDialog());

  runApp(const MyApp());

  // runApp(const DefaultExampleRefactoring());
  // runApp(const LottieExample());
  // runApp(const ClipOverflowExample());
  // runApp(const PageViewExample());
  // runApp(HomeRoadmapView());
  // runApp(const ScrollTagExample());
  // runApp(const ListRefreshItemExample());
  // runApp(const FadeAnimationImageExample());
  // runApp(const YoutubePlayerExample());
  // runApp(const MultipleSelectionList());
  // runApp(const NavigatorWithoutRouteExample());
  // runApp(const CustomDialogExample());
  // runApp(const OnlineVideoPlayerExample());
  // runApp(const GridViewWaterfallExample());
  // runApp(const PhysicalBackPressHandlerExample());

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
  // dartTest.viiiAsync();
  //
  // // dartTest.fetchDataTest();
  // dartTest.fetchDataTestWithDIO();
}

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blueGrey,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {

  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {

      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
      ),
      body: Center(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
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
