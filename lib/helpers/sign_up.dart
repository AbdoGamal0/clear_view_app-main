import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

Future<void> usreRegister(TextEditingController emailController,
    TextEditingController passwordController) async {
  FirebaseAuth auth = FirebaseAuth.instance;
  UserCredential user = await auth.createUserWithEmailAndPassword(
      email: emailController.value.text,
      password: passwordController.value.text);

  print(user.user!.email);
}
