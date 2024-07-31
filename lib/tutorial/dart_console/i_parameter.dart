import '../../framework/debug/i_log.dart';

void main() {

  const tag = "parameters";

  // 整数
  int i = 123;
  ILog.debug(tag, i);

  // 浮点数
  double d = 456.5;
  ILog.debug(tag, d);

  // 布尔值
  bool b = true;
  ILog.debug(tag, b);

  // 字符串
  String name = "seok ho\nHow are you?";
  ILog.debug(tag, name);
  ILog.debug(tag, name[2]); // 取字符，结果是o
  ILog.debug(tag, name * 5); // 把 name 的值复制5次

  // 字符串
  String longString = """
  Hello
  World
  """;
  ILog.debug(tag, longString);

  // 原始字符串，忽略转意符
  String rawString = r"seok ho\nHow are you?";
  ILog.debug(tag, rawString); // seok ho\nHow are you?

  // 字符串格式化
  String formatString = "1 + 1 = ${1 + 1}";
  ILog.debug(tag, formatString);

  // 只能赋值一次
  const String finalString = "123";

  // 常量，也只能赋值一次
  const String constString = "aaa";

  // final 和 const 只有本质区别的，在后面的类的部分会解释。

  String test = "  apple, banana, orange,   mango";
  // String test = "  apple";
  List<String> resultList = test.split(",").map((String s) => s.trim()).toList();
  for (int i = 0; i < resultList.length; i++) {
    ILog.debug(tag, resultList[i]);
  }
  ILog.debug(tag, "total count ${resultList.length}");

}