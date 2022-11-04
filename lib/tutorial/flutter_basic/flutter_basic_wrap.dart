
import 'package:flutter/material.dart';
import 'package:sh_flutter_code/framework/debug/i_log.dart';

/// 流布局，相当于 row, 但是 wrap 会自动换行，比如 tag
/// 如果 tag 太多，超出屏幕了，是不会自动滚动的，需要嵌套在滑动里才行
class FlutterBasicWrapExample extends StatelessWidget {
  const FlutterBasicWrapExample({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Wrap Example"),
        ),
        body: _WrapExampleView(),
      ),
    );
  }
}

class _WrapExampleView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Wrap(
        direction: Axis.horizontal, // 主轴方向
        alignment: WrapAlignment.start, // 主轴对齐方式
        spacing: 5, // 主轴方向的间距
        runAlignment: WrapAlignment.start, // 新的一行，即纵轴的对齐方式
        runSpacing: 5, // 新的一行，即纵轴的间距
        children: const [
          _TagItemView("xxxxx"),
          _TagItemView("xxx"),
          _TagItemView("xxxxxxxxxxxxxxxxxxxxxxxxxxx"),
          _TagItemView("xxxxx"),
          _TagItemView("xxxx"),
          _TagItemView("xxxxx"),
          _TagItemView("xxx"),
          _TagItemView("xxx"),
          _TagItemView("xxxx"),
          _TagItemView("xxxx"),
          _TagItemView("xxxxx"),
          _TagItemView("xxxx"),
          _TagItemView("xx"),
          _TagItemView("xxx"),
          _TagItemView("xxxxx"),
          _TagItemView("xxx"),
          _TagItemView("xxxxxxxxxxxxxxxxxxxxxxxxxxx"),
          _TagItemView("xxxxx"),
          _TagItemView("xxxx"),
          _TagItemView("xxxxx"),
          _TagItemView("xxx"),
          _TagItemView("xxx"),
          _TagItemView("xxxx"),
          _TagItemView("xxxx"),
          _TagItemView("xxxxx"),
          _TagItemView("xxxx"),
          _TagItemView("xx"),
          _TagItemView("xxx"),
          _TagItemView("xxxxx"),
          _TagItemView("xxx"),
          _TagItemView("xxxxxxxxxxxxxxxxxxxxxxxxxxx"),
          _TagItemView("xxxxx"),
          _TagItemView("xxxx"),
          _TagItemView("xxxxx"),
          _TagItemView("xxx"),
          _TagItemView("xxx"),
          _TagItemView("xxxx"),
          _TagItemView("xxxx"),
          _TagItemView("xxxxx"),
          _TagItemView("xxxx"),
          _TagItemView("xx"),
          _TagItemView("xxx"),
          _TagItemView("xxxxx"),
          _TagItemView("xxx"),
          _TagItemView("xxxxxxxxxxxxxxxxxxxxxxxxxxx"),
          _TagItemView("xxxxx"),
          _TagItemView("xxxx"),
          _TagItemView("xxxxx"),
          _TagItemView("xxx"),
          _TagItemView("xxx"),
          _TagItemView("xxxx"),
          _TagItemView("xxxx"),
          _TagItemView("xxxxx"),
          _TagItemView("xxxx"),
          _TagItemView("xx"),
          _TagItemView("xxx"),
          _TagItemView("xxxxx"),
          _TagItemView("xxx"),
          _TagItemView("xxxxxxxxxxxxxxxxxxxxxxxxxxx"),
          _TagItemView("xxxxx"),
          _TagItemView("xxxx"),
          _TagItemView("xxxxx"),
          _TagItemView("xxx"),
          _TagItemView("xxx"),
          _TagItemView("xxxx"),
          _TagItemView("xxxx"),
          _TagItemView("xxxxx"),
          _TagItemView("xxxx"),
          _TagItemView("xx"),
          _TagItemView("xxx"),
        ],
      ),
    ) ;
  }
}

class _TagItemView extends StatelessWidget {

  static const tag = "_TagItemView";

  final String tagString;

  const _TagItemView(this.tagString);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shadowColor: Colors.greenAccent,
        elevation: 5,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.0)),
        minimumSize: const Size(100, 50),
        padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
      ),
      onPressed: () {
        ILog.debug(tag, "onPressed");
      },
      onHover: (bool isHover) {
        ILog.debug(tag, "onHover $isHover");
      },
      child: Text(
        tagString,
        style: const TextStyle(
            color: Colors.white,
            fontSize: 20
        ),
      ),
    );
  }
}