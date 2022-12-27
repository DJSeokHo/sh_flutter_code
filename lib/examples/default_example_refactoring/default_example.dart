import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sh_flutter_code/examples/default_example_refactoring/default_example_view_model.dart';

class DefaultExampleRefactoring extends StatelessWidget {
  const DefaultExampleRefactoring({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Default Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (BuildContext context) => DefaultExampleViewModel(),
          )
        ],
        child: _ContentView(),
      ),
    );
  }
}

class _ContentView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Default Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _InfoView(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: context.read<DefaultExampleViewModel>().signIn,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

class _InfoView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _InfoViewState();
}

class _InfoViewState extends State<_InfoView> {
  @override
  Widget build(BuildContext context) {
    return Text(
      Provider.of<DefaultExampleViewModel>(context).model != null ? Provider.of<DefaultExampleViewModel>(context).model!.name : "sign in please",
    );
  }

}