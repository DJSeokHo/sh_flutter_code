import '../../framework/debug/i_log.dart';

class VIIIAsync {

  static const tag = "VIIIAsync";

  void futureAndThen() {

    Future.delayed(const Duration(seconds: 2), () {
      return "futureAndThen";
    }).then((value) {
      ILog.debug(tag, value);
    });
  }

  void futureAndThenWithException() {

    Future.delayed(const Duration(seconds: 1), () {
      // return "futureAndThen";
      throw AssertionError("futureAndThenWithException Error!!!");
    }).then((value) {
      ILog.debug(tag, value);
    }).catchError((e){
      //执行失败会走到这里
      ILog.debug(tag, e);
    }).whenComplete(() {
      //无论成功或失败都会走到这里
      ILog.debug(tag, "futureAndThenWithException whenComplete");
    });
  }

  void futureWithMultipleFuture() {

    Future.wait([
      // 3秒后返回结果
      Future.delayed(const Duration(seconds: 3), () {
        return "3 seconds";
      }),
      // 4秒后返回结果
      Future.delayed(const Duration(seconds: 4), () {
        return "4 second";
      })
    ]).then((values) {
      ILog.debug(tag, "${values[0]} ${values[1]}");
    }).catchError((e){
      //执行失败会走到这里
      ILog.debug(tag, e);
    }).whenComplete(() {
      //无论成功或失败都会走到这里
      ILog.debug(tag, "futureAndThenWithException whenComplete");
    });
  }

  //先分别定义各个异步任务
  Future<String> login(String userName, String pwd) async {
    //用户登录
    ILog.debug(tag, "login $userName $pwd");
    return "id";
  }

  Future<String> getUserInfo(String id) async {
    //获取用户信息
    ILog.debug(tag, "getUserInfo $id");
    return "nickname";
  }

  Future saveUserInfo(String userInfo) async {
    // 保存用户信息
    ILog.debug(tag, "saveUserInfo $userInfo");
  }

  void task() async {

    // 使用 async/await 消除 callback hell
    try{
      String id = await login("alice","******");
      String userInfo = await getUserInfo(id);
      await saveUserInfo(userInfo);
      //执行接下来的操作
    } catch(e) {
      //错误处理
      ILog.debug(tag, e);
    }
  }
}

void main() {
  VIIIAsync viiiAsync = VIIIAsync();
  viiiAsync.futureAndThen();
  viiiAsync.futureAndThenWithException();
  viiiAsync.futureWithMultipleFuture();
  viiiAsync.task();
}