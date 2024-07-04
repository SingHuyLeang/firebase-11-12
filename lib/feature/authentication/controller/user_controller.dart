import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserContoller extends GetxController {
  final emailCtr = TextEditingController();
  final passCtr = TextEditingController();

  Future<dynamic> signUp() async {
    if (emailCtr.text.isNotEmpty && passCtr.text.isNotEmpty) {
      try {
        await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
          email: emailCtr.text.trim(),
          password: passCtr.text.trim(),
        )
            .whenComplete(() {
          emailCtr.clear();
          passCtr.clear();
        });
      } on FirebaseAuthException catch (e) {
        log('${e.message}');
      }
    } else {
      log("Enter data");
    }
  }

  Future<void> signIn(BuildContext context) async {
    if (emailCtr.text.isNotEmpty && passCtr.text.isNotEmpty) {
      try {
        await FirebaseAuth.instance
            .signInWithEmailAndPassword(
              email: emailCtr.text.trim(),
              password: passCtr.text.trim(),
            )
            .then((value) => value.user != null
                ? Navigator.pushNamedAndRemoveUntil(
                    context,
                    '/shop',
                    (route) => false,
                  )
                : null);
      } on FirebaseAuthException catch (e) {
        if (e.code == "invalid-email") {
          log('Invalid email');
        }
      }
    } else {
      log("Enter data");
    }
  }
}
