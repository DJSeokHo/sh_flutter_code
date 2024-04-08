import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sh_flutter_code/examples/get_x_examples/list_example/get_x_list_observer_example.dart';
import 'package:sh_flutter_code/framework/event/event.dart';

class GetXListDetailObserverExample extends StatelessWidget {

  final ListItemModel model;

  const GetXListDetailObserverExample({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
          onPressed: () {
            eventCenter.emit("getXListDetailDeleteEvent", this, <String, dynamic>{}..["model"] = model);
            Get.back();
          },
          child: Text("Delete ${model.title}")
      ),
    );
  }
}
