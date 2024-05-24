import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sh_flutter_code/examples/riverpod_example/riverpod_signin_example/view_model/riverpod_signin_view_model.dart';

void main() {
  runApp(const ProviderScope(child: MaterialApp(home: RiverpodSigninExample(),)));
}

class RiverpodSigninExample extends ConsumerWidget {
  const RiverpodSigninExample({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final viewModel = ref.watch(RiverpodSigninViewModel.viewModel);

    return Scaffold(
      appBar: AppBar(title: const Text('User')),
      body: Center(
          child: viewModel == null
              ? ElevatedButton(
                  onPressed: () {
                    ref.read(RiverpodSigninViewModel.viewModel.notifier).fetchData();
                  },
                  child: const Text('Load User'),
                )
              : Text("Hello, ${viewModel.name}, your email is ${viewModel.email}")),
    );
  }
}