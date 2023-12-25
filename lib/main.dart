import 'dart:io';
import 'package:flutter/material.dart';
import 'framework/debug/i_log.dart';

// --web-hostname 192.168.0.4 --web-port 8081
void main() {

  const _tag = "main";

  // device info, only for not web
  if(Platform.isAndroid) {
    // Android
    ILog.debug(_tag, "Android");
  }
  else if(Platform.isIOS) {
    // IOS
    ILog.debug(_tag, "iOS");
  }
  else if(Platform.isFuchsia) {
    // Fuchsia
    ILog.debug(_tag, "Fuchsia");
  }
  else if(Platform.isWindows) {
    // Windows
    ILog.debug(_tag, "Window");
  }
  else if(Platform.isMacOS) {
    // MacOS
    ILog.debug(_tag, "Mac");
  }
  else if(Platform.isLinux) {
    // Linux
    ILog.debug(_tag, "Linux");
  }

  // disable web right click only for web
  // window.document.onContextMenu.listen((evt) => evt.preventDefault());

  runApp(const MyApp());
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
      home: const MyHomePageView(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePageView extends StatefulWidget {

  const MyHomePageView({super.key, required this.title});

  final String title;

  @override
  State<MyHomePageView> createState() => _MyHomePageViewState();
}

class _MyHomePageViewState extends State<MyHomePageView> {

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
