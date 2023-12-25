
import 'package:flutter/material.dart';

class FlutterBasicGridView extends StatelessWidget {
  const FlutterBasicGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Grid View"
          ),
        ),
        // body: _FlutterBasicGridViewWithCount(),
        body: _FlutterBasicGridViewWithBuild(),
      ),
    );
  }
}

class _FlutterBasicGridViewWithBuild extends StatelessWidget {

  List<_TestModel> list = [];

  _FlutterBasicGridViewWithBuild() {
    for (int i = 0; i < 100; i++) {
      list.add(
          _TestModel(
              "简述 $i",
              "$i 화성이 화성군에 없는 것처럼."
          )
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: list.length,
      itemBuilder: _createItem,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 4.0,
        mainAxisSpacing: 4.0,
      )
    );
  }

  Widget _createItem(context, index) {

    return Container(
      padding: const EdgeInsets.all(8),
      alignment: Alignment.center,
      color: Colors.blue,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            list[index].title,
            style: const TextStyle(color: Colors.white, fontSize: 16),
          ),
          const SizedBox(height: 10,),
          Text(
            list[index].subTitle,
            style: const TextStyle(color: Colors.white, fontSize: 12),
          )
        ],
      ),
    );
  }
}


class _FlutterBasicGridViewWithCount extends StatelessWidget {

  List<_TestModel> list = [];

  _FlutterBasicGridViewWithCount() {
    for (int i = 0; i < 100; i++) {
      list.add(
          _TestModel(
              "简述 $i",
              "$i 화성이 화성군에 없는 것처럼."
          )
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      padding: const EdgeInsets.all(2.0),
      crossAxisSpacing: 2, // 横向间距
      mainAxisSpacing: 2, // 纵向间距
      crossAxisCount: 3, // 列数
      // childAspectRatio: 1, // 每一项的宽高比例
      children: _createItem(),
    );
  }

  List<Widget> _createItem() {

    List<Widget> itemList = [];
    for (int i = 0; i < list.length; i++) {
      itemList.add(
        Container(
          padding: const EdgeInsets.all(8),
          alignment: Alignment.center,
          color: Colors.blue,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                list[i].title,
                style: const TextStyle(color: Colors.white, fontSize: 16),
              ),
              Text(
                list[i].subTitle,
                style: const TextStyle(color: Colors.white, fontSize: 12),
              )
            ],
          ),
        )
      );
    }

    return itemList;
  }
}

class _TestModel {

  String title = "";
  String subTitle = "";

  _TestModel(this.title, this.subTitle);
}

void main() {
  runApp(const FlutterBasicGridView());
}