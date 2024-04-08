import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../framework/debug/i_log.dart';
import '../../../framework/event/event.dart';
import 'get_x_list_detail_observer_example.dart';

class ListItemModel {
  String title = "";
}

class GetXListObserverViewModel extends GetxController {
  final ScrollController scrollController = ScrollController();
  final list = <ListItemModel>[].obs;
  final loading = false.obs;

  @override
  void onInit() {
    super.onInit();
    ILog.debug("???", "onInit");

    eventCenter.on("getXListDetailDeleteEvent", this, (arrow, any, data) {
      ListItemModel model = data["model"] as ListItemModel;
      list.remove(model);
    });

    scrollController.addListener(() {
      loadMore();
    });
    reload();
  }

  @override
  void onClose() {
    ILog.debug("???", "onClose");
    eventCenter.off(this);
    scrollController.dispose();
    super.onClose();
  }

  void reload() {
    loading.value = true;

    Future.delayed(const Duration(milliseconds: 1500), () async {
      return _fetchData(0, 20);
    }).then((value) {
      loading.value = false;

      list.clear();
      list.addAll(value);
    });
  }

  void loadMore() {
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      loading.value = true;

      Future.delayed(const Duration(milliseconds: 1000), () async {
        return _fetchData(list.length, 10);
      }).then((value) {
        loading.value = false;
        list.addAll(value);
      });
    }
  }

  List<ListItemModel> _fetchData(int offset, int limit) {
    List<ListItemModel> data = [];
    for (int i = offset; i < offset + limit; i++) {
      data.add(ListItemModel()..title = "title $i");
    }
    return data;
  }
}

class GetXListObserverExample extends StatelessWidget {
  final GetXListObserverViewModel _viewModel =
      Get.put(GetXListObserverViewModel());

  GetXListObserverExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("GetX Title"),
      ),
      body: Stack(
        children: [
          Obx(() {
            return RefreshIndicator(
                // 下拉刷新，第一步 用RefreshIndicator
                onRefresh: () {
                  return Future(() => _viewModel.reload());
                },
                child: ListView.builder(
                  physics: const AlwaysScrollableScrollPhysics(),
                  // 下拉刷新，第二步 physics设置成 AlwaysScrollableScrollPhysics
                  controller: _viewModel.scrollController,
                  itemCount: _viewModel.list.length,
                  itemBuilder: (BuildContext context, int index) {
                    // return ListTile(
                    //   title: Text(_viewModel.list[index].title),
                    // );

                    final item = _viewModel.list[index];
                    return Dismissible(
                      // Each Dismissible must contain a Key. Keys allow Flutter to
                      // uniquely identify widgets.
                      key: Key(item.hashCode.toString()),
                      // Provide a function that tells the app
                      // what to do after an item has been swiped away.
                      onDismissed: (direction) {
                        // Remove the item from the data source.
                        _viewModel.list.removeAt(index);
                        // Then show a snackbar.
                        Get.snackbar("Deleted!", "${item.title} dismissed");
                      },
                      child: ListTile(
                        title: Text(item.title),
                        onTap: () {
                          Get.to(() => GetXListDetailObserverExample(model: item));
                        },
                      ),
                    );
                  },
                ));
          }),
          Positioned(
              right: 50,
              bottom: 50,
              child: Column(
                children: [
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.black,
                          backgroundColor: Colors.deepOrange,
                          elevation: 20,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8))),
                      onPressed: () {
                        _viewModel.list.removeAt(3);
                      },
                      child: const Text("Delete")),

                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.black,
                          backgroundColor: Colors.deepOrange,
                          elevation: 20,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8))),
                      onPressed: () {
                        _viewModel.reload();

                        _viewModel.scrollController.animateTo(
                          0.0,
                          duration: const Duration(milliseconds: 1),
                          curve: Curves.easeInOut,
                        );
                      },
                      child: const Text("Refresh"))
                ],
              )),
          Obx(() {
            if (_viewModel.loading.isTrue) {
              return const _ProgressView();
            } else {
              return const SizedBox.shrink();
            }
          })
        ],
      ),
    );
  }
}

class _ProgressView extends StatelessWidget {
  const _ProgressView();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {},
        child: GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () {},
          child: Center(
              child: Container(
            padding: const EdgeInsets.all(40),
            decoration: const BoxDecoration(
                color: Colors.black54,
                borderRadius: BorderRadius.all(Radius.circular(10))),
            child: const CircularProgressIndicator(
              color: Colors.white,
              strokeWidth: 8,
            ),
          )),
        ),
      ),
    );
  }
}

void main() {
  runApp(GetMaterialApp(title: "GetX", home: GetXListObserverExample()));
}
