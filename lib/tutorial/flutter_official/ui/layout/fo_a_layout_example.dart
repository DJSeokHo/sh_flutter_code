

import 'package:flutter/material.dart';

void main() {
  runApp(
    _ContentView()
  );
}

class _ContentView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: "layout example",
      home: Scaffold(
        appBar: AppBar(
          title: const Text("layout example"),
        ),
        // body: Column( // 不支持滚动
        body: ListView( // 支持滚动
          children: [
            Image.asset(
              "images/lake.jpg",
              width: 600,
              height: 240,
              fit: BoxFit.cover,
            ),
            _titleSection,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildButtonColumn(Theme.of(context).primaryColor, Icons.call, "CALL"),
                _buildButtonColumn(Theme.of(context).primaryColor, Icons.near_me, "ROUTE"),
                _buildButtonColumn(Theme.of(context).primaryColor, Icons.share, "SHARE"),
              ],
            ),
            textSection
          ],
        ),
      ),
    );
  }

  final Widget textSection = Container(
    padding: const EdgeInsets.all(32),
    child: const Text(
      'Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese '
          'Alps. Situated 1,578 meters above sea level, it is one of the '
          'larger Alpine Lakes. A gondola ride from Kandersteg, followed by a '
          'half-hour walk through pastures and pine forest, leads you to the '
          'lake, which warms to 20 degrees Celsius in the summer. Activities '
          'enjoyed here include rowing, and riding the summer toboggan run.',
      softWrap: true, // 通过设置 softwrap 为 true，文本将在填充满列宽后在单词边界处自动换行
    ),
  );

  Column _buildButtonColumn(Color color, IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [

        Icon(icon, color: color),

        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: color
            ),
          ),
        )
      ],
    );
  }

  final Widget _titleSection = Container(
    padding: const EdgeInsets.all(32),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Container(
                padding: const EdgeInsets.only(bottom: 8),
                child: const Text(
                  "Oeschinen Lake Campground",
                  style: TextStyle(
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),

              Text(
                "Kandersteg, Switzerland",
                style: TextStyle(
                  color: Colors.grey[500]
                ),
              )

            ],
          )
        ),
        
        Icon(
          Icons.star,
          color: Colors.red[500],
        ),
        const Text("41")
      ],
    ),
  );
}