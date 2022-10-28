
import '../framework/debug/i_log.dart';

class VIAbstractClass {

  static const _tag = "VIAbstractClass";

  void test() {

    Animal dog = Dog();
    dog.eat();
    ILog.debug(_tag, dog.say());

  }
}

abstract class Animal {
  void eat(); // 抽象方法
  String say();
}

class Dog extends Animal {

  static const _tag = "Dog";

  @override
  void eat() {
    ILog.debug(_tag, "dog eat meat");
  }

  @override
  String say() {
    return "Wang, Wang";
  }

}