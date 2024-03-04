import 'package:flutter/material.dart';
import '../../framework/debug/i_log.dart';

class VClass {

  // 类里面的常量必须用 static const 来声明，而不在类中的常量可以只用 const 来声明
  static const _tag = "VClass";

  void test() {

    Person.greeting();

    var person = Person("who", 21);

    person.printInfo();

    ILog.debug(_tag, person.type());
    person.name = "new who";
    person.printInfo();

    // 类似链式操作，这样来给成员变量来赋值更方便。
    person
      ..name = "new new who"
      ..age = 30;

    person.printInfo();

    var developer = Developer("developer", 20);
    developer.printInfo();
    ILog.debug(_tag, developer.type());

    ILog.debug(_tag, person.description);

    // 声明和初始化一个常量类
    const constPerson = ConstPerson("name", 20);
    ILog.debug(_tag, constPerson.name);

    // person();
    person("hello");
  }
}

// 一般类
class Person {

  static const _tag = "Person";

  String name;
  int age;

  // 计算属性(Person这个类的属性description，他的值是通过计算得来的，所以叫计算属性。)
  // String get description {
  //   return "$name $age";
  // }

  // 计算属性也可以这样简写，如果可以的话。
  String get description => "$name $age";

  // 语法糖的构造方法
  Person(this.name, this.age) {
    ILog.debug(_tag, "construction");
  }

  void printInfo() {
    ILog.debug(_tag, "name is $name and age is $age");
  }

  String type() {
    return runtimeType.toString();
  }

  static void greeting() {
    ILog.debug(_tag, "Hello");
  }

  // 实现这个方法可以让实例像方法一样直接执行，比如： person();
  // void call() {
  //   ILog.debug(_tag, "this is person object");
  // }

  void call(String content) {
    ILog.debug(_tag, "this is person object with parameter ${content}");
  }
}

/// 类继承
class Developer extends Person {
  Developer(super.name, super.age);
}

// 常量类
class ConstPerson {
  final String name;
  final int age;

  const ConstPerson(this.name, this.age);
}

void main() {
  VClass().test();
}
