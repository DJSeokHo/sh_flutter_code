import 'package:sh_flutter_code/framework/extension/extension_list.dart';

import '../debug/i_log.dart';

const _tag = "EventCenter";

class EventObserver {

  final String event;
  final Object object;
  final Function(String arrow, Object any, Map<String, dynamic> data) run;

  EventObserver({required this.event, required this.object, required this.run} );
}

class EventCenter {

  //私有构造函数
  EventCenter._internal();

  //保存单例
  static final EventCenter _singleton = EventCenter._internal();

  //工厂构造函数
  factory EventCenter()=> _singleton;

  //保存事件订阅者队列，key:事件名(id)，value: 对应事件的订阅者队列
  final Map<String, List<EventObserver>> _eventMap = {};

  // add observer obj on an event
  void on(String event, Object obj, Function(String arrow, Object any, Map<String, dynamic> data) run) {

    EventObserver eventObserver = EventObserver(event: event, object: obj, run: run);
    _getObserverListForArrows(event).add(eventObserver);

    for (var keyName in _eventMap.keys) {
      ILog.debug(_tag, "keyName $keyName");
      ILog.debug(_tag, "keyName's length: ${_eventMap[keyName]?.length}");
    }
  }

  // remove observer auto
  void off(Object object) {

    List<EventObserver> deleteList = [];

    for (var list in _eventMap.values) {
      deleteList.clear();

      for (var observer in list) {
        if (observer.object == object) {
          deleteList.add(observer);
        }
      }

      list.removeAll(deleteList);
    }

    for (var keyName in _eventMap.keys) {
      ILog.debug(_tag, "keyName $keyName");
      ILog.debug(_tag, "keyName's length: ${_eventMap[keyName]?.length}");
    }
  }

  //触发事件，事件触发后该事件所有订阅者会被调用
  void emit(String event, Object sender, Map<String, dynamic> data) {

    var result = _getObserverListForArrows(event);

    for (var eventObserver in result) {
      eventObserver.run(event, sender, data);
    }
  }

  List<EventObserver> _getObserverListForArrows(String event) {
    if (_eventMap.containsKey(event)) {
      return _eventMap[event]!;
    }
    else {
      List<EventObserver> list = [];
      _eventMap[event] = list;
      return list;
    }
  }
}


//定义一个top-level（全局）变量，页面引入该文件后可以直接使用bus
var eventCenter = EventCenter();