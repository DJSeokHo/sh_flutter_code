

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sh_flutter_code/examples/riverpod_example/riverpod_basic_example/view_model/riverpod_basic_view_model.dart';

class RiverpodExampleSubView extends ConsumerWidget {
  const RiverpodExampleSubView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("Riverpod Example Sub View"),
        actions: [
        IconButton(
          onPressed: () {
            // 手动重置状态。
            ref.invalidate(RiverpodBasicViewModel.counterNotifierProvider);
            ref.invalidate(RiverpodBasicViewModel.counterForSubViewNP);
          },
          icon: const Icon(Icons.refresh),
        ),
      ],
      ),
      body: Center(
        child: Column(
          children: [
            Text(
             ref.watch(RiverpodBasicViewModel.counterForSubViewNP).toString(),
             style: Theme.of(context).textTheme.displayMedium,
            ),
            Text(
             ref.watch(RiverpodBasicViewModel.counterNotifierProvider).toString(),
             style: Theme.of(context).textTheme.displayMedium,
           )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
       child: const Icon(Icons.add),
       onPressed: () {
         // Using the WidgetRef to read() the counterProvider just one time.
         //   - unlike watch(), this will never rebuild the widget automatically
         // We don't want to get the int but the actual StateNotifier, hence we access it.
         // StateNotifier exposes the int which we can then mutate (in our case increment).
         ref.read(RiverpodBasicViewModel.counterNotifierProvider.notifier).increment();
         ref.read(RiverpodBasicViewModel.counterForSubViewNP.notifier).increment();
       },
     ),
    );
  }
}