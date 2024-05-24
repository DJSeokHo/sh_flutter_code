class RiverpodBasicRepository {

  /*
我们将伪造WebSocket，并简单地返回本地生成的Stream ，这些整数每隔半秒就会递增。我们还将利用一个抽象类作为接口，以便代码可以很容易地被替换为真正的实现或测试。
 */
  static Stream<int> getCounterStream([int start = 0]) async* {
    int i = start;
    while (i < 100) {
      await Future.delayed(const Duration(milliseconds: 1000));
      yield i++;
    }
  }
}
