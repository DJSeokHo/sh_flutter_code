
import 'package:flutter/material.dart';

/// 有点类似 web 的 flex 布局
/// 可以和 row, column 结合使用
class FlutterBasicExpandedExample extends StatelessWidget {
  const FlutterBasicExpandedExample({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Flutter Expanded Example")
        ),
        // body: _ExpandedView(),
        // body: _ExpandedFixedSizeAndAutoExpandedView(),
        body: _DifficultExpandedView(),
      ),
    );
  }
}

class _DifficultExpandedView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [

        const SizedBox(height: 5,),

        Padding(
          padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
          child: Container(
            color: Colors.black,
            height: 140,
          ),
        ),

        const SizedBox(height: 5,),

        Padding(
          padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
          child: SizedBox(
            height: 145,
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Image.network(
                      "https://blog.zh-hant.playstation.com/tachyon/sites/8/2022/09/deaec17c85f27b7d60a283dcc6cd3e06b8c94795.jpg?resize=1088%2C612&crop_strategy=smart",
                      height: 145,
                      fit: BoxFit.cover
                  ),
                ),

                const SizedBox(width: 5,),

                Expanded(
                  flex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Image.network(
                          "https://p2.bahamut.com.tw/B/2KU/56/bbe78d08f009d51b7a9b44c82c1ia4s5.JPG?v=1664433407175",
                          height: 70,
                          fit: BoxFit.cover
                      ),
                      const SizedBox(height: 5,),
                      Image.network(
                          "https://i.ytimg.com/vi/L4jcGVmY_n0/maxresdefault.jpg",
                          height: 70,
                          fit: BoxFit.cover
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _ExpandedView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        Expanded(
          flex: 1,
          child: _IconView(Colors.blue, Icons.search),
        ),
        Expanded(
          flex: 2,
          child: _IconView(Colors.orange, Icons.home),
        ),
        Expanded(
          flex: 1,
          child: _IconView(Colors.red, Icons.select_all),
        ),
      ],
    );
  }
}

class _ExpandedFixedSizeAndAutoExpandedView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    /// 第1, 4个固定，第2, 3个按照比例自己调整
    return Row(
      children: const [
        _IconView(Colors.blue, Icons.search),
        Expanded(
          flex: 2,
          child: _IconView(Colors.orange, Icons.home),
        ),
        Expanded(
          flex: 3,
          child: _IconView(Colors.red, Icons.select_all),
        ),
        _IconView(Colors.blue, Icons.search),
      ],
    );
  }
}

class _IconView extends StatelessWidget {

  final Color color;
  final IconData iconData;

  const _IconView(this.color, this.iconData);

  @override
  Widget build(BuildContext context) {

    return Container(
      width: 100,
      height: 100,
      // color: Colors.red, Container 的 decoration 不能和 color 一起用，会出错
      decoration: BoxDecoration(
          color: color,
          borderRadius: const BorderRadius.all(Radius.circular(10))
      ),
      child: Center(
        child: Icon(iconData, size: 32, color: Colors.white),
      ),
    );
  }

}

void main() {
  runApp(const FlutterBasicExpandedExample());
}