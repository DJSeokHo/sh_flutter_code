
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FBNWRRSignUpInfoView extends StatelessWidget {
  const FBNWRRSignUpInfoView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign Up Info"),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          children: [
            const SizedBox(height: 50,),
            const Text("Auth Info"),
            const SizedBox(height: 20,),
            ElevatedButton(
                onPressed: () {
                  Navigator.popUntil(context, (route) {
                    return route.isFirst; // 回到跟路由
                  });
                },
                child: const Text("Finish")
            )
          ],
        ),
      ),
    );
  }

}