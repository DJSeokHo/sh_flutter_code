
import 'package:flutter/material.dart';

class FlutterBasicDynamicListView extends StatelessWidget {

  const FlutterBasicDynamicListView({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Dynamic list"),
        ),
        // body: _DynamicListView(),
        body: _DynamicListViewWithData(),
      ),
    );
  }
}

class _TestModel {

  String title = "";
  String subTitle = "";

  _TestModel(this.title, this.subTitle);
}

class _DynamicListViewWithData extends StatelessWidget {

  List<_TestModel> list = [];

  _DynamicListViewWithData() {
    for (int i = 0; i < 100; i++) {
      list.add(
          _TestModel(
              "简述 $i",
              "$i 화성이 화성군에 없는 것처럼 달성과 월성 또한 각각 달성군과 월성군에 없는 상황이었으나 달성과 월성은 통합으로 문제가 해결되었다. 그러나 화성군만은 월성군이나 금성시처럼 명칭이 '수원군'으로 환원되지도 않아 도농분리로 인해 지역 명칭과 명칭의 유래가 맞지 않는 유일한 사례가 되었다. 또한 1995년 도농통합 당시 수원시(및 오산시)와도 통합되지 않은 채 2001년에는 독자적으로 시로 승격되어 현재에 이른다."
          )
      );
    }
  }

  Widget _createItem(context, index) {
    return ListTile(
      title: Text(list[index].title),
      subtitle: Text(list[index].subTitle),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: list.length,
      itemBuilder: _createItem
    );
  }
}

class _DynamicListView extends StatelessWidget {

  List<_TestModel> _getData() {

    List<_TestModel> list = [];
    for (int i = 0; i < 100; i++) {
      list.add(
          _TestModel(
              "简述 $i",
              "$i 화성이 화성군에 없는 것처럼 달성과 월성 또한 각각 달성군과 월성군에 없는 상황이었으나 달성과 월성은 통합으로 문제가 해결되었다. 그러나 화성군만은 월성군이나 금성시처럼 명칭이 '수원군'으로 환원되지도 않아 도농분리로 인해 지역 명칭과 명칭의 유래가 맞지 않는 유일한 사례가 되었다. 또한 1995년 도농통합 당시 수원시(및 오산시)와도 통합되지 않은 채 2001년에는 독자적으로 시로 승격되어 현재에 이른다."
          )
      );
    }

    return list;
  }

  List<Widget> _getListItem() {

    List<Widget> list = [];

    // for (int i = 0; i < 100; i++) {
    //   list.add(
    //     ListTile(
    //       title: Text(
    //           "简述 $i"
    //       ),
    //       subtitle: Text(
    //           "$i 화성이 화성군에 없는 것처럼 달성과 월성 또한 각각 달성군과 월성군에 없는 상황이었으나 달성과 월성은 통합으로 문제가 해결되었다. 그러나 화성군만은 월성군이나 금성시처럼 명칭이 '수원군'으로 환원되지도 않아 도농분리로 인해 지역 명칭과 명칭의 유래가 맞지 않는 유일한 사례가 되었다. 또한 1995년 도농통합 당시 수원시(및 오산시)와도 통합되지 않은 채 2001년에는 독자적으로 시로 승격되어 현재에 이른다."
    //       ),
    //     )
    //   );
    // }

    var tempList = _getData();

    for (int i = 0; i < tempList.length; i++) {
      list.add(
          ListTile(
            title: Text(
                tempList[i].title
            ),
            subtitle: Text(
                tempList[i].subTitle
            ),
          )
      );
    }

    return list;
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.vertical,
      padding: const EdgeInsets.all(10),
      children: _getListItem(),
    );
  }

}

void main() {
  runApp(const FlutterBasicDynamicListView());
}