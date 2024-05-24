
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sh_flutter_code/examples/riverpod_example/riverpod_counter_example/view_model/riverpod_counter_view_model.dart';

class RiverpodCounterExampleSubPage extends ConsumerWidget {
  const RiverpodCounterExampleSubPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final int count = ref.watch(RiverpodCounterViewModel.clickCountNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('增加计数'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('点击计数：$count'),
            ElevatedButton(
                onPressed: () {
                  // ⑤ 获取Provider的通知器修改状态值(自增)
                  ref.read(RiverpodCounterViewModel.clickCountNotifierProvider.notifier).increment();
                },
                child: const Text('点击计数+1'),
              )
          ],
        ))
    );
  }
}
