
import 'package:flutter/material.dart';

import '../../framework/debug/i_log.dart';

class FlutterBasicDynamicListView extends StatelessWidget {

  const FlutterBasicDynamicListView({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Dynamic list"),
        ),
        body: const _SimpleListView()
      ),
    );
  }
}

class _SimpleListView extends StatefulWidget {
  const _SimpleListView();

  @override
  State<StatefulWidget> createState() {
    return _SimpleListViewState();
  }
}

class _SimpleListViewState extends State<_SimpleListView> {

  final ScrollController _scrollController = ScrollController();
  final List<Map<String, String>> _data = [];

  @override
  void initState() {
    super.initState();
    _initData();
    _scrollController.addListener(_onLoadMore);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  Future<List<Map<String, String>>> _fetchData(int offset, int limit) async {
    List<Map<String, String>> data = [];
    for (int i = offset; i < offset + limit; i++) {
      data.add({'title': 'Item $i', 'content': 'Content for Item $i'});
    }
    return data;
  }

  Future<void> _initData() async {

    var list = await _fetchData(0, 20);
    setState(() {
      _data.clear();
      _data.addAll(list);

      _scrollController.animateTo(
        0.0,
        duration: const Duration(milliseconds: 1),
        curve: Curves.easeInOut,
      );
    });
  }

  void _onLoadMore() {

    if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {

      ILog.debug("123", "load more??");

      _fetchData(_data.length, 10).then((value) => {
        setState(() {
        _data.addAll(value);
        })
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ListView.builder(
          controller: _scrollController,
          itemCount: _data.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Text(_data[index]['title']!),
              subtitle: Text(_data[index]['content']!),
            );
          },
        ),

        Positioned(
          right: 50,
          bottom: 50,
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.black,
                  backgroundColor: Colors.deepOrange,
                  elevation: 20,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)
                  )
              ),
              onPressed: () {
                _initData();
              },
              child: const Text("Refresh")
          )
        )
      ],
    );

  }
}

void main() {
  runApp(const FlutterBasicDynamicListView());
}