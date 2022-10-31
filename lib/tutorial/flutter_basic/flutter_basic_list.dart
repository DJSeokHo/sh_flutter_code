
import 'package:flutter/material.dart';

class FlutterBasicListView extends StatelessWidget {

  const FlutterBasicListView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("List demo"),
        ),
        // body: _SimpleListView(),
        body: _HorizontalListView(),
      )
    );
  }
}

class _HorizontalListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
      children: [
        Image.network(
          "https://cdn1.epicgames.com/salesEvent/salesEvent/EGS_GenshinImpact_miHoYoLimited_S2_1200x1600-c12cdcc2cac330df2185aa58c508e820",
          fit: BoxFit.contain, // 有空隙的地方重复图片来进行填充
        ),
        Container(
          width: 20,
        ),
        Image.network(
          "https://cdn1.epicgames.com/salesEvent/salesEvent/EGS_GenshinImpact_miHoYoLimited_S2_1200x1600-c12cdcc2cac330df2185aa58c508e820",
          fit: BoxFit.contain, // 有空隙的地方重复图片来进行填充
        ),
        Image.network(
          "https://cdn1.epicgames.com/salesEvent/salesEvent/EGS_GenshinImpact_miHoYoLimited_S2_1200x1600-c12cdcc2cac330df2185aa58c508e820",
          fit: BoxFit.contain, // 有空隙的地方重复图片来进行填充
        ),
        Image.network(
          "https://cdn1.epicgames.com/salesEvent/salesEvent/EGS_GenshinImpact_miHoYoLimited_S2_1200x1600-c12cdcc2cac330df2185aa58c508e820",
          fit: BoxFit.contain, // 有空隙的地方重复图片来进行填充
        )
      ],
    );
  }
}

class _CustomListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.vertical,
      padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
      children: [
        Image.network(
          "https://cdn1.epicgames.com/salesEvent/salesEvent/EGS_GenshinImpact_miHoYoLimited_S2_1200x1600-c12cdcc2cac330df2185aa58c508e820",
          fit: BoxFit.contain, // 有空隙的地方重复图片来进行填充
        ),
        Container(
          height: 20,
        ),
        Image.network(
          "https://cdn1.epicgames.com/salesEvent/salesEvent/EGS_GenshinImpact_miHoYoLimited_S2_1200x1600-c12cdcc2cac330df2185aa58c508e820",
          fit: BoxFit.contain, // 有空隙的地方重复图片来进行填充
        ),
        Image.network(
          "https://cdn1.epicgames.com/salesEvent/salesEvent/EGS_GenshinImpact_miHoYoLimited_S2_1200x1600-c12cdcc2cac330df2185aa58c508e820",
          fit: BoxFit.contain, // 有空隙的地方重复图片来进行填充
        ),
        Image.network(
          "https://cdn1.epicgames.com/salesEvent/salesEvent/EGS_GenshinImpact_miHoYoLimited_S2_1200x1600-c12cdcc2cac330df2185aa58c508e820",
          fit: BoxFit.contain, // 有空隙的地方重复图片来进行填充
        )
      ],
    );
  }
}

class _SimpleListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.vertical,
      padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
      children: [
        const ListTile( // 列表项
          title: Text(
            "主标题",
            style: TextStyle(
              fontSize: 24
            ),
          ),
          subtitle: Text("副标题"),
          leading: Icon(
            Icons.access_alarm,
            color: Colors.deepOrange,
          ),
        ),
        const ListTile( // 列表项
          title: Text(
            "简述",
            style: TextStyle(
                fontSize: 24
            ),
          ),
          subtitle: Text(
            "화성이 화성군에 없는 것처럼 달성과 월성 또한 각각 달성군과 월성군에 없는 상황이었으나 달성과 월성은 통합으로 문제가 해결되었다. 그러나 화성군만은 월성군이나 금성시처럼 명칭이 '수원군'으로 환원되지도 않아 도농분리로 인해 지역 명칭과 명칭의 유래가 맞지 않는 유일한 사례가 되었다. 또한 1995년 도농통합 당시 수원시(및 오산시)와도 통합되지 않은 채 2001년에는 독자적으로 시로 승격되어 현재에 이른다.",
            style: TextStyle(
              fontSize: 20
            ),
          ),
          trailing: Icon(Icons.add_a_photo_outlined),
        ),
        ListTile( // 列表项
          title: const Text("主标题 1"),
          subtitle: const Text("副标题 1"),
          leading: Image.network(
            "https://cdn1.epicgames.com/salesEvent/salesEvent/EGS_GenshinImpact_miHoYoLimited_S2_1200x1600-c12cdcc2cac330df2185aa58c508e820",
            fit: BoxFit.contain, // 有空隙的地方重复图片来进行填充
          ),
        ),
        const ListTile( // 列表项
          title: Text("主标题 2"),
          subtitle: Text("副标题 2"),
        ),
        ListTile( // 列表项
          leading: Image.network(
            "https://cdn1.epicgames.com/salesEvent/salesEvent/EGS_GenshinImpact_miHoYoLimited_S2_1200x1600-c12cdcc2cac330df2185aa58c508e820",
            fit: BoxFit.contain, // 有空隙的地方重复图片来进行填充
          ),
          title: const Text("简述"),
          subtitle: const Text("화성이 화성군에 없는 것처럼 달성과 월성 또한 각각 달성군과 월성군에 없는 상황이었으나 달성과 월성은 통합으로 문제가 해결되었다. 그러나 화성군만은 월성군이나 금성시처럼 명칭이 '수원군'으로 환원되지도 않아 도농분리로 인해 지역 명칭과 명칭의 유래가 맞지 않는 유일한 사례가 되었다. 또한 1995년 도농통합 당시 수원시(및 오산시)와도 통합되지 않은 채 2001년에는 독자적으로 시로 승격되어 현재에 이른다."),
          trailing: Image.network(
            "https://cdn1.epicgames.com/salesEvent/salesEvent/EGS_GenshinImpact_miHoYoLimited_S2_1200x1600-c12cdcc2cac330df2185aa58c508e820",
            fit: BoxFit.contain, // 有空隙的地方重复图片来进行填充
          ),
        ),
        const ListTile( // 列表项
          title: Text("简述"),
          subtitle: Text("화성이 화성군에 없는 것처럼 달성과 월성 또한 각각 달성군과 월성군에 없는 상황이었으나 달성과 월성은 통합으로 문제가 해결되었다. 그러나 화성군만은 월성군이나 금성시처럼 명칭이 '수원군'으로 환원되지도 않아 도농분리로 인해 지역 명칭과 명칭의 유래가 맞지 않는 유일한 사례가 되었다. 또한 1995년 도농통합 당시 수원시(및 오산시)와도 통합되지 않은 채 2001년에는 독자적으로 시로 승격되어 현재에 이른다."),
        ),
        const ListTile( // 列表项
          title: Text("简述"),
          subtitle: Text("화성이 화성군에 없는 것처럼 달성과 월성 또한 각각 달성군과 월성군에 없는 상황이었으나 달성과 월성은 통합으로 문제가 해결되었다. 그러나 화성군만은 월성군이나 금성시처럼 명칭이 '수원군'으로 환원되지도 않아 도농분리로 인해 지역 명칭과 명칭의 유래가 맞지 않는 유일한 사례가 되었다. 또한 1995년 도농통합 당시 수원시(및 오산시)와도 통합되지 않은 채 2001년에는 독자적으로 시로 승격되어 현재에 이른다."),
        ),
        const ListTile( // 列表项
          title: Text("简述"),
          subtitle: Text("화성이 화성군에 없는 것처럼 달성과 월성 또한 각각 달성군과 월성군에 없는 상황이었으나 달성과 월성은 통합으로 문제가 해결되었다. 그러나 화성군만은 월성군이나 금성시처럼 명칭이 '수원군'으로 환원되지도 않아 도농분리로 인해 지역 명칭과 명칭의 유래가 맞지 않는 유일한 사례가 되었다. 또한 1995년 도농통합 당시 수원시(및 오산시)와도 통합되지 않은 채 2001년에는 독자적으로 시로 승격되어 현재에 이른다."),
        ),
        const ListTile( // 列表项
          title: Text("简述"),
          subtitle: Text("화성이 화성군에 없는 것처럼 달성과 월성 또한 각각 달성군과 월성군에 없는 상황이었으나 달성과 월성은 통합으로 문제가 해결되었다. 그러나 화성군만은 월성군이나 금성시처럼 명칭이 '수원군'으로 환원되지도 않아 도농분리로 인해 지역 명칭과 명칭의 유래가 맞지 않는 유일한 사례가 되었다. 또한 1995년 도농통합 당시 수원시(및 오산시)와도 통합되지 않은 채 2001년에는 독자적으로 시로 승격되어 현재에 이른다."),
        ),
      ],
    );
  }
}