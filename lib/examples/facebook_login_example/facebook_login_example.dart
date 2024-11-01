
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:crypto/crypto.dart';
import 'dart:math';
import 'dart:convert';

import '../../firebase_options.dart';
import '../../framework/debug/i_log.dart';


Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    // 参考：https://firebase.google.com/docs/flutter/setup?platform=ios&hl=zh-cn
    options: DefaultFirebaseOptions.currentPlatform
  );

  runApp(const MaterialApp(home: FacebookLoginExample(),));
}

class FacebookLoginExample extends StatefulWidget {
  const FacebookLoginExample({super.key});

  @override
  State<StatefulWidget> createState() {
    return _FacebookLoginExampleState();
  }
}

class _FacebookLoginExampleState extends State<FacebookLoginExample> {

  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Facebook login example"),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.white,
        child: Center(
          child: TextButton(onPressed: () async {

            if (Platform.isIOS) {

              UserCredential userCredential = await signInWithFacebookIOS();
              ILog.debug("??", userCredential.credential!.accessToken.toString());
              ILog.debug("??", userCredential.additionalUserInfo!.username.toString());
              ILog.debug("??", userCredential.user!.email.toString());
              ILog.debug("??", userCredential.user!.photoURL.toString());

              return;
            }

            UserCredential userCredential = await signInWithFacebook();
            ILog.debug("??", userCredential.credential!.accessToken.toString());
            ILog.debug("??", userCredential.additionalUserInfo!.username.toString());
            ILog.debug("??", userCredential.user!.email.toString());
            ILog.debug("??", userCredential.user!.photoURL.toString());

          }, child: const Text("Login")),
        ),
      )
    );
  }

  Future<UserCredential> signInWithFacebook() async {
    // Trigger the sign-in flow
    final LoginResult loginResult = await FacebookAuth.instance.login();

    ILog.debug("???", "signInWithFacebook ${loginResult.accessToken!.tokenString}");

    // Create a credential from the access token
    final OAuthCredential facebookAuthCredential = FacebookAuthProvider.credential(loginResult.accessToken!.tokenString);

    // Once signed in, return the UserCredential
    return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
  }

  Future<UserCredential> signInWithFacebookIOS() async {
    final rawNonce = _generateNonce();
       final nonce = _sha256ofString(rawNonce);
       final LoginResult loginToken = await FacebookAuth.instance.login(
           loginTracking: LoginTracking.limited,
           nonce: nonce,
       );
       final OAuthCredential facebookAuthCredential =
           OAuthProvider('facebook.com').credential(
               idToken: loginToken.accessToken!.tokenString,
               rawNonce: rawNonce,
           );
       return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
  }

  String _generateNonce([int length = 32]) {
    const charset =
        '0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._';
    final random = Random.secure();
    return List.generate(length, (_) =>
      charset[random.nextInt(charset.length)]).join();
  }

  String _sha256ofString(String input) {
      final bytes = utf8.encode(input);
      final digest = sha256.convert(bytes);
      return digest.toString();
  }

}