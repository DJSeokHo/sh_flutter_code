import 'package:flutter/material.dart';
import '../../framework/debug/i_log.dart';

class VClass {

  static const _tag = "VClass";

  void test() {

    Person.greeting();

    var person = Person("who", 21);

    person.printInfo();
    ILog.debug(_tag, person.type());
    person.name = "new who";
    person.printInfo();

    // 类似链式操作
    person
      ..name = "new new who"
      ..age = 30;
    person.printInfo();

    var developer = Developer("developer", 20);
    developer.printInfo();
    ILog.debug(_tag, developer.type());
  }
}

class Person {

  static const _tag = "Person";

  String name;
  int age;

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
}

/// 类继承
class Developer extends Person {
  Developer(super.name, super.age);
}

void main() {
  VClass().test();
}
