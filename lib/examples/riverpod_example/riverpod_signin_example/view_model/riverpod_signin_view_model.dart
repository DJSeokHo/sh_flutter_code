import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sh_flutter_code/examples/riverpod_example/riverpod_signin_example/model/riverpod_signin_user_model.dart';
import 'package:sh_flutter_code/examples/riverpod_example/riverpod_signin_example/repository/riverpod_signin_repository.dart';

class RiverpodSigninViewModel {

  static final viewModel = NotifierProvider<UserNotifier, RiverpodSigninUserModel?>(() {
    return UserNotifier();
  });
}

class UserNotifier extends Notifier<RiverpodSigninUserModel?> {

  @override
  RiverpodSigninUserModel? build() {
    return null;
  }

  void fetchData() async {
    state = await RiverpodSigninRepository.fetchUserData();
  }
}