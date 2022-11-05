import 'package:flutter/material.dart';

class FBNWRRSignInView extends StatelessWidget {
  const FBNWRRSignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign In"),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          children: [
            const SizedBox(height: 50,),
            const Text("Welcome"),
            const SizedBox(height: 20,),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(
                      context,
                      '/sign_up_auth'
                  );
                },
                child: const Text("Sign Up")
            ),
            const SizedBox(height: 20,),
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("Back")
            )
          ],
        ),
      ),
    );
  }

}