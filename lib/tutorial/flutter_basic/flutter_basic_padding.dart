
import 'package:flutter/material.dart';

class FlutterBasicPaddingExample extends StatelessWidget {
  const FlutterBasicPaddingExample({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Padding example"),
        ),
        body: _PaddingExampleView(),
      ),
    );
  }

}

/// 有些组件没有 padding 属性，所以我们用padding这个控件来弄内边距
class _PaddingExampleView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2, // 列数
      childAspectRatio: 1.78, // 每一项的宽高比例
      children: [
        Padding(
          padding: const EdgeInsets.all(5),
          child: Image.network(
              "https://cdn1.epicgames.com/salesEvent/salesEvent/Landscape%20Product%20image-CHT_2560x1440-e263d461e84ff35235be426313a9aea3",
              fit: BoxFit.cover
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(5),
          child: Image.network(
              "https://blog.zh-hant.playstation.com/tachyon/sites/8/2022/09/deaec17c85f27b7d60a283dcc6cd3e06b8c94795.jpg?resize=1088%2C612&crop_strategy=smart",
              fit: BoxFit.cover
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(5),
          child: Image.network(
              "https://p2.bahamut.com.tw/B/2KU/56/bbe78d08f009d51b7a9b44c82c1ia4s5.JPG?v=1664433407175",
              fit: BoxFit.cover
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(5),
          child: Image.network(
              "https://i.ytimg.com/vi/L4jcGVmY_n0/maxresdefault.jpg",
              fit: BoxFit.cover
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(5),
          child: Image.network(
              "https://webstatic.mihoyo.com/upload/op-public/2022/09/27/197d6f767544aac5f1510bfa00c88eef_5097977401478401614.png",
              fit: BoxFit.cover
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(5),
          child: Image.network(
              "https://webstatic.mihoyo.com/upload/static-resource/2021/11/08/55ccd259cca4f64ae81f2d113a153bae_8366165624319984079.png",
              fit: BoxFit.cover
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(5),
          child: Image.network(
              "https://cdn1.epicgames.com/salesEvent/salesEvent/Landscape%20Product%20image-CHT_2560x1440-e263d461e84ff35235be426313a9aea3",
              fit: BoxFit.cover
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(5),
          child: Image.network(
              "https://blog.zh-hant.playstation.com/tachyon/sites/8/2022/09/deaec17c85f27b7d60a283dcc6cd3e06b8c94795.jpg?resize=1088%2C612&crop_strategy=smart",
              fit: BoxFit.cover
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(5),
          child: Image.network(
              "https://p2.bahamut.com.tw/B/2KU/56/bbe78d08f009d51b7a9b44c82c1ia4s5.JPG?v=1664433407175",
              fit: BoxFit.cover
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(5),
          child: Image.network(
              "https://i.ytimg.com/vi/L4jcGVmY_n0/maxresdefault.jpg",
              fit: BoxFit.cover
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(5),
          child: Image.network(
              "https://webstatic.mihoyo.com/upload/op-public/2022/09/27/197d6f767544aac5f1510bfa00c88eef_5097977401478401614.png",
              fit: BoxFit.cover
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(5),
          child: Image.network(
              "https://webstatic.mihoyo.com/upload/static-resource/2021/11/08/55ccd259cca4f64ae81f2d113a153bae_8366165624319984079.png",
              fit: BoxFit.cover
          ),
        ),
      ]
    );
  }
}