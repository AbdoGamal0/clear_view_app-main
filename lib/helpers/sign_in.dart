import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

Future<void> UsreLogin(TextEditingController emailController,
    TextEditingController passwordController) async {
  // ignore: unused_local_variable
  final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
    email: emailController.value.text,
    password: passwordController.value.text,
  );
}
