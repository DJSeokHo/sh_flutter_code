import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'list_example/get_x_list_observer_example.dart';

class GetXWidgetExample extends StatelessWidget {
  GetXWidgetExample({super.key});

  final saveValue = "".obs;
  final count = 0.obs;

  void _increment() {
    count.value++;
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "GetX",
      home: Scaffold(
        appBar: AppBar(
          title: const Text("GetX Title"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {
                    Get.snackbar("Snackbar 标题", "欢迎使用Snackbar");
                  },
                  child: const Text("显示 Snackbar")
              ),

              const SizedBox(height: 10,),

              ElevatedButton(
                  onPressed: () {
                    Get.defaultDialog(title: "title", middleText: "内容", textConfirm: "Confirm", textCancel: "Cancel", onConfirm: () {
                        Get.back();
                      }, onCancel: () {
                        Get.back();
                      },
                        barrierDismissible: false // 是否可以取消
                    );
                  },
                  child: const Text("显示 Dialog")
              ),

              const SizedBox(height: 10,),

              ElevatedButton(onPressed: () {
                Get.bottomSheet(
                    Wrap(
                      children: [
                        ListTile(
                          leading: const Icon(Icons.wb_sunny_outlined),
                          title: const Text("白天模式"),
                          onTap: () {
                            Get.changeTheme(ThemeData.light());
                          },
                        ),
                        ListTile(
                          leading: const Icon(Icons.wb_sunny),
                          title: const Text("黑夜模式"),
                          onTap: () {
                            Get.changeTheme(ThemeData.dark());
                          },
                        )
                      ],
                    )
                );
              }, child: const Text("Bottom Sheet")),

              const SizedBox(height: 10,),

              Obx(() {
                return Text(
                  "count的值为: ${count.value}",
                  style: const TextStyle(color: Colors.red, fontSize: 30),
                );
              }),

              const SizedBox(height: 10,),
              ElevatedButton(
                  onPressed: () {
                    _increment();
                  },
                  child: const Text("点我加1")
              ),

              Obx(() {
                return Text(
                  "saveValue的值为: ${saveValue.value}",
                  style: const TextStyle(color: Colors.red, fontSize: 30),
                );
              }),

              const SizedBox(height: 10,),
              ElevatedButton(
                  onPressed: () {
                    GetStorage box = GetStorage();
                    box.write("key", "234");
                  },
                  child: const Text("Save")
              ),

              const SizedBox(height: 10,),
              ElevatedButton(
                  onPressed: () {
                    GetStorage box = GetStorage();
                    saveValue.value = box.read("key");
                  },
                  child: const Text("Load")
              ),

              const SizedBox(height: 10,),
              ElevatedButton(
                  onPressed: () {
                    Get.to(() => GetXListObserverExample());
                  },
                  child: const Text("Go List")
              )
            ],
          ),
        ),
      ),
    );
  }
}

void main() {

  GetStorage.init();
  runApp(GetXWidgetExample());
}