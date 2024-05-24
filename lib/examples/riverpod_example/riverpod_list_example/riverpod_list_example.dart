import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sh_flutter_code/examples/riverpod_example/riverpod_list_example/view_model/riverpod_list_view_model.dart';

import '../../../framework/debug/i_log.dart';

void main() {
  runApp(const ProviderScope(child: MaterialApp(home: RiverpodListView())));
}

class RiverpodListView extends ConsumerStatefulWidget {
  const RiverpodListView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _RiverpodListViewState();
  }
}

class _RiverpodListViewState extends ConsumerState<RiverpodListView> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    // 加载初始数据
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _reload();
    });

    // 监听滚动事件
    _scrollController.addListener(() {
      if (_scrollController.position.atEdge &&
          _scrollController.position.pixels != 0) {
        _loadMore();
      }
    });
  }

  void _reload() async {
    ILog.debug("???", "_reload");
    ref.read(RiverpodListViewModel.loadingNotifierProvider.notifier).toggle(true);
    await ref
        .read(RiverpodListViewModel.listNotifierProvider.notifier)
        .reload();
    _scrollController.jumpTo(0);
    ref.read(RiverpodListViewModel.loadingNotifierProvider.notifier).toggle(false);
  }

  void _loadMore() async {
    ILog.debug("???", "_loadMore");
    ref.read(RiverpodListViewModel.loadingNotifierProvider.notifier).toggle(true);
    await ref.read(RiverpodListViewModel.listNotifierProvider.notifier).loadMore();
    ref.read(RiverpodListViewModel.loadingNotifierProvider.notifier).toggle(false);
  }

  @override
  Widget build(BuildContext context) {
    final list = ref.watch(RiverpodListViewModel.listNotifierProvider);
    final loading = ref.watch(RiverpodListViewModel.loadingNotifierProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Riverpod ListView')),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: [

            RefreshIndicator(
              onRefresh: () async {
                _reload();
              },
              child: ListView.builder(
                controller: _scrollController,
                itemCount: list.length,
                itemBuilder: (context, index) {
                  final item = list[index];
                  return ListTile(
                    title: Text(item.title),
                    subtitle: Text(item.message),
                  );
                },
              ),
            ),

            if (loading)
              Container(
                width: double.infinity,
                height: double.infinity,
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
              )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _reload();
        },
        tooltip: 'Increment',
        child: const Icon(Icons.refresh),
      ), //
    );
  }
}
