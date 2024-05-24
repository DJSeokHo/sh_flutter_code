import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sh_flutter_code/examples/riverpod_example/riverpod_list_example/model/riverpod_list_model.dart';
import 'package:sh_flutter_code/examples/riverpod_example/riverpod_list_example/repository/riverpod_list_repository.dart';

import '../../../../framework/debug/i_log.dart';

class RiverpodListViewModel {

  static final loadingNotifierProvider = NotifierProvider<LoadingNotifier, bool>(() {
    return LoadingNotifier();
  });

  static final listNotifierProvider = NotifierProvider<ListNotifier, List<RiverpodListModel>>(() {
    return ListNotifier();
  });
}

class LoadingNotifier extends Notifier<bool> {

  @override
  bool build() {
    return false;
  }

  void toggle(bool loading) {
    state = loading;
  }
}

class ListNotifier extends Notifier<List<RiverpodListModel>> {

  @override
  List<RiverpodListModel> build() {
    return [];
  }

  Future<void> reload() async {
    state = await RiverpodListRepository.fetchData(0, 20);
    ILog.debug("???", "reload state ${state.length}");
  }

  Future<void> loadMore() async {
    final currentList = state;
    final moreList = await RiverpodListRepository.fetchData(currentList.length);
    state = [...currentList, ...moreList];
    ILog.debug("???", "loadMore state ${state.length}");
  }
}