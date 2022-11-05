
import 'package:flutter/material.dart';

class FBNWRRSignUpAuthView extends StatelessWidget {
  const FBNWRRSignUpAuthView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign Up Auth"),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          children: [
            const SizedBox(height: 50,),
            const Text("Auth Number"),
            const SizedBox(height: 20,),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(
                      context,
                      '/sign_up_info'
                  );
                },
                child: const Text("Next")
            )
          ],
        ),
      ),
    );
  }

}