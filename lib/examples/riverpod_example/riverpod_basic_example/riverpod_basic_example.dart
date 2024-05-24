import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sh_flutter_code/examples/riverpod_example/riverpod_basic_example/riverpod_basic_example_sub_page.dart';
import 'package:sh_flutter_code/examples/riverpod_example/riverpod_basic_example/view_model/riverpod_basic_view_model.dart';

void main() {
  runApp(const ProviderScope(
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      home: RiverpodBasicExampleView(),
    )
  ));
}

class RiverpodBasicExampleView extends ConsumerWidget {
  const RiverpodBasicExampleView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    _addListener(context, ref);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Riverpod Example View"),
        actions: [
          IconButton(
            onPressed: () {
              // 手动重置状态。
              // ref.invalidate(counterProvider);
              ref.invalidate(RiverpodBasicViewModel.counterNotifierProvider);
              ref.invalidate(RiverpodBasicViewModel.counterStreamProvider);
            },
            icon: const Icon(Icons.refresh),
          ),
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const RiverpodExampleSubView(),
                    fullscreenDialog: false),
              );
            },
            icon: const Icon(Icons.navigate_next),
          )
        ],
      ),
      body: Center(
        child: Column(
          children: [
            Text(ref.watch(RiverpodBasicViewModel.helloWorldProvider)),
            Text(
              ref.watch(RiverpodBasicViewModel.counterNotifierProvider).toString(),
              style: Theme.of(context).textTheme.displayMedium,
            ),
            Text(
              ref.watch(RiverpodBasicViewModel.counterStreamProvider).when(
                data: (int value) {
                  return value;
                },
                error: (Object e, _) {
                  return e;
                },
                loading: () {
                  return 0;
                },
              ).toString(),
              style: Theme.of(context).textTheme.displayMedium,
            ),
            Text(
              ref.watch(RiverpodBasicViewModel.counterStreamProvider).when(
                data: (int value) {
                  return value;
                },
                error: (Object e, _) {
                  return e;
                },
                loading: () {
                  return 0;
                },
              ).toString(),
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
        },
      ),
    );
  }

  void _addListener(BuildContext context, WidgetRef ref) {
    ref.listen(RiverpodBasicViewModel.counterNotifierProvider, (previous, next) {
      if (next >= 5) {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text('Warning'),
              content: const Text(
                  'Counter dangerously high. Consider resetting it.'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('OK'),
                )
              ],
            );
          },
        );
      }
    });
  }
}
