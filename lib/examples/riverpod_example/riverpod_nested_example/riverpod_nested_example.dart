import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sh_flutter_code/examples/riverpod_example/riverpod_nested_example/view_model/riverpod_nested_view_model.dart';

void main() {
  // ② 想使用Riverpod 的 Provider 必须用 ProviderScope 包裹MyApp！
  runApp(
      const ProviderScope(child: MaterialApp(home: RiverpodNestedExample())));
}

class RiverpodNestedExample extends ConsumerWidget {
  const RiverpodNestedExample({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final type = ref.watch(RiverpodNestedViewModel.typeNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Riverpod Example View"),
      ),
      body: Center(
        child: Column(
          children: [

            Text(type),
            Row(
              children: [
                ElevatedButton(
                    onPressed: () {
                      ref.read(RiverpodNestedViewModel
                          .typeNotifierProvider.notifier)
                          .toggle("A");
                    },
                    child: const Text("A")),
                ElevatedButton(
                    onPressed: () {
                      ref.read(RiverpodNestedViewModel
                          .typeNotifierProvider.notifier)
                          .toggle("B");
                    },
                    child: const Text("B")),
              ],
            ),

            // ref.watch(RiverpodNestedViewModel.typeListFutureProvider).when(
            ref.watch(RiverpodNestedViewModel.typeListParameterFutureProvider(type)).when(
              data: (List<String> list) {
                return Expanded(child: ListView(
                    scrollDirection: Axis.vertical,
                    padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
                    children: [
                      for (String value in list)
                        ListTile( // 列表项
                          title: Text(
                            value,
                            style: const TextStyle(
                                fontSize: 24
                            ),
                          ),
                        ),
                    ]
                ));
              },
              error: (Object e, _) {
                return Text(e.toString());
              },
              loading: () {
                return const Center(child: Text("loading.."));
              },
            )

          ],
        ),
      ),
    );
  }
}
