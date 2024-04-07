import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class User {
  String name = "";
  int age = 0;
}

class GetXClassObserverViewModel extends GetxController {

  final user = User().obs;

  @override
  void onInit() {
    super.onInit();

    user.value.name = "hahaha";
    user.value.age = 10;
  }
}

class GetXClassObserverExample extends StatelessWidget {
  GetXClassObserverExample({super.key});

  final GetXClassObserverViewModel _viewModel = Get.put(GetXClassObserverViewModel());

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

              Obx(() {
                return Text(
                  "user name: ${_viewModel.user.value.name}\nuser age: ${_viewModel.user.value.age}",
                  style: const TextStyle(color: Colors.red, fontSize: 30),
                );
              }),

              const SizedBox(height: 10,),
              ElevatedButton(
                  onPressed: () {

                    User newUser = User();
                    newUser.name = "aaa";
                    newUser.age = 11;
                    _viewModel.user.value = newUser;

                    // 以下是无效的，因为我监听的是这个类，而不是类的变量。
                    // _viewModel.user.value.name = "aaa";
                    // _viewModel.user.value.age = 11;
                  },
                  child: const Text("change")
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void main() {

  GetStorage.init();
  runApp(GetXClassObserverExample());
}