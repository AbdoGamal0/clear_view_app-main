import 'package:flutter/material.dart';

import '../../../../../core/utils/config/constants.dart';

class SenderChatBubble extends StatelessWidget {
  const SenderChatBubble({
    super.key,
    required this.massege,
  });
  final String massege;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: kDefultPadding,
          horizontal: kDefultPadding,
        ),
        // margin: const EdgeInsets.all(kDefultPadding),
        decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xff7A72B6), kPrimaryColor],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
            borderRadius: BorderRadius.only(
              // topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
              bottomRight: Radius.circular(20),
              bottomLeft: Radius.circular(20),
            )),
        child: Text(massege),
      ),
    );
  }
}
