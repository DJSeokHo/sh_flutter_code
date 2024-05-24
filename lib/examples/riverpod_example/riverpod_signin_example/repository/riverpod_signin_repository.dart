import 'package:sh_flutter_code/examples/riverpod_example/riverpod_signin_example/model/riverpod_signin_user_model.dart';

class RiverpodSigninRepository {

  static Future<RiverpodSigninUserModel> fetchUserData() async {
    await Future.delayed(const Duration(milliseconds: 1000));
    return RiverpodSigninUserModel(id: "123", email: "test@test.com", name: "test");
  }
}