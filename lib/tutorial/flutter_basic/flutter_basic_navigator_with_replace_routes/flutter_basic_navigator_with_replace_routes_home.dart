
import 'package:flutter/material.dart';

class FBNWRRHomeStateView extends StatefulWidget {
  const FBNWRRHomeStateView({super.key});

  @override
  State<StatefulWidget> createState() {
    return _FBNWRRHomeView();
  }
}

class _FBNWRRHomeView extends State<StatefulWidget> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Replace Route"),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          children: [
            const SizedBox(height: 50,),
            const Text("Home"),
            const SizedBox(height: 20,),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(
                      context,
                      '/sign_in'
                  );
                },
                child: const Text("Sign In")
            )
          ],
        ),
      ),
    );
  }

}