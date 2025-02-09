import 'package:flutter/material.dart';

import '../../../../../core/utils/config/constants.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.controller,
    required this.masseges,
    required this.scrollController,
  });
  final ScrollController scrollController;
  final TextEditingController controller;
  final String masseges;
  @override
  Widget build(BuildContext context) {
    return TextField(
        autofocus: false,
        enabled: true,
        controller: controller,
        onSubmitted: (value) {
          // masseges.add({
          //   'massege': value,
          //   'createdAt': DateTime.now(),
          //   'email': FirebaseAuth.instance.currentUser!.email
          // });
          controller.clear();
          scrollController.animateTo(
            0,
            duration: const Duration(microseconds: 800),
            curve: Curves.easeIn,
          );
        },
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: kPrimaryColor,
            ),
          ),
          hintText: 'Type your message here',
          suffixIcon: IconButton(
            onPressed: () {
              // masseges.add({
              //   'massege': controller.text,
              //   'createdAt': DateTime.now(),
              //   'email': FirebaseAuth.instance.currentUser!.email
              // });
              controller.clear();
            },
            icon: const Icon(Icons.send, color: kPrimaryColor),
          ),
        ));
  }
}
