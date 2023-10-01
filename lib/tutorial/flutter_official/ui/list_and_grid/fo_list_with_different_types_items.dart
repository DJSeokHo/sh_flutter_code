
import 'package:flutter/material.dart';

void main() {
  runApp(
    _ContentView()
  );
}

class _ContentView extends StatelessWidget {

  final items = List<_ListItem>.generate(
    1000,
        (i) => i % 6 == 0
        ? _HeadingItem('Heading $i')
        : _MessageItem('Sender $i', 'Message body $i'),
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Different types",
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Different types")
        ),
        body: ListView.builder(
          /**
           * 标准的 ListView 构造函数适用于短列表，对于具有大量列表项的长列表，需要用 ListView.builder 构造函数来创建。
           * 与标准的 ListView 构造函数需要一次性创建所有列表项不同的是， ListView.builder 构造函数只在列表项从屏幕外滑入屏幕时才去创建列表项。
           */
          // Let the ListView know how many items it needs to build.
          itemCount: items.length,
          // Provide a builder function. This is where the magic happens.
          // Convert each item into a widget based on the type of item it is.
          itemBuilder: (context, index) {
            final item = items[index];

            return ListTile(
              title: item.buildTitle(context),
              subtitle: item.buildSubTitle(context),
            );
          },
        ),
      ),
    );
  }
}

abstract class _ListItem {
  Widget buildTitle(BuildContext context);
  Widget buildSubTitle(BuildContext context);
}

class _HeadingItem implements _ListItem {

  final String heading;

  _HeadingItem(this.heading);

  @override
  Widget buildSubTitle(BuildContext context) {
    return Text(
      heading,
      style: Theme.of(context).textTheme.headlineSmall,
    );
  }

  @override
  Widget buildTitle(BuildContext context) {
    return const SizedBox.shrink();
  }
}

class _MessageItem implements _ListItem {
  final String sender;
  final String body;

  _MessageItem(this.sender, this.body);

  @override
  Widget buildTitle(BuildContext context) {
    return Text(sender);
  }

  @override
  Widget buildSubTitle(BuildContext context) {
    return Text(body);
  }
}