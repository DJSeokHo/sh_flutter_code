import 'package:flutter/material.dart';

class MultipleSelectionList extends StatelessWidget {
  const MultipleSelectionList({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: _ContentView(),
    );
  }
}

class _ContentView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ContentViewState();
  }
}

class _ContentViewState extends State<_ContentView> {

  List<Map> _list = []; //列表
  List<String> deleteIds = []; //要删除的ID数组
  bool _isOff = true; //相关组件显示隐藏控制，true代表隐藏
  bool _checkValue = false; //总的复选框控制开关

  //先初始化一些数据，当然这些数据实际中会调用接口的
  @override
  void initState() {
    super.initState();

    for (var index = 0; index <= 5; index++) {
      Map temp = {};
      temp['id'] = index;
      temp['select'] = false;
      _list.add(temp);
    }
    setState(() {
      _list = _list;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('我的收藏'),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.edit),
              tooltip: "编辑",
              onPressed: () {
                for (var f in _list) {
                  f['select'] = false; //列表设置为未选中
                }
                deleteIds = []; //重置选中的ID数组
                setState(() {
                  _isOff = !_isOff; //显示隐藏总开关
                  _checkValue = false; //所以复选框设置为未选中
                  _list = _list;
                });
              },
            ),
          ],
        ), //这个是顶部tab样式，如果不需要可以去掉
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: getItem(),
        ));
  }

  //主内容
  Widget getItem() {
    if (_list.isEmpty) {
      return const Center(child: Text('暂无收藏'));
    } else {
      return Container(
        padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10.0),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: <Widget>[
            getItemContent(), //这里是列表的内容
            getItemBottom(), //这里是底部删除全选操作的内容
          ],
        ),
      );
    }
  }

  //底部操作样式
  Widget getItemBottom() {
    return Offstage(
      offstage: _isOff,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
        child: Container(
            height: 40,
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Checkbox(
                      value: _checkValue,
                      onChanged: (value) {
                        selectAll(value);
                      },
                    ),
                    const Text('全选'),
                  ],
                ),
                InkWell(
                  child: const Text('删除'),
                  onTap: () {},
                ),
              ],
            )),
      ),
    );
  }

  //底部复选框的操作逻辑
  selectAll(value) {
    deleteIds = []; //要删除的数组ID重置
    for (var f in _list) {
      f['select'] = value;
      if (value == true) {
        //如果是选中，则将数据ID放入数组
        deleteIds.add(f['id'].toString());
      }
    }
    setState(() {
      _checkValue = value;
      _list = _list;
    });
  }

  //列表
  Widget getItemContent() {
    return ListView.builder(
      itemBuilder: (context, index) {
        return _createGridViewItem(_list[index]);
      },
      itemCount: _list.length,
    );
  }

  //单个crad,这里可以自己定义一些样式
  Widget _createGridViewItem(item) {
    Color color = Colors.primaries[item['id']];
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 5, 8, 5),
      child: Container(
        height: 80,
        color: color,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Offstage(
              offstage: _isOff,
              child: Checkbox(
                value: item['select'],
                onChanged: (value) {
                  if (value == false) {
                    deleteIds.remove(item['id'].toString());
                  } else {
                    deleteIds.add(item['id'].toString());
                  }
                  setState(() {
                    item['select'] = value;
                  });
                },
              ),
            ),
            const Text('这里放内容'),
          ],
        ),
      ),
    );
  }
}
