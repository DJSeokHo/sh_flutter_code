import 'dart:math';

import '../model/riverpod_list_model.dart';

class RiverpodListRepository {

  static Future<List<RiverpodListModel>> fetchData(int offset, [int limit = 10]) async {

    await Future.delayed(Duration(milliseconds: Random().nextInt(1501)));
    List<RiverpodListModel> list = [];
    for (int i = offset; i < offset + limit; i++) {
      list.add(RiverpodListModel(title: "title $i", message: "message $i"));
    }
    return list;
  }
}
