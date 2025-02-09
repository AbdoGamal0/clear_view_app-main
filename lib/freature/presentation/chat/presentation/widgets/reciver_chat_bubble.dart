import 'package:flutter/material.dart';

import '../../../../../core/utils/config/constants.dart';

class ReciverChatBubble extends StatelessWidget {
  const ReciverChatBubble({
    super.key,
    required this.massege,
  });
  final String massege;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        padding: const EdgeInsets.all(kDefultPadding),
        // margin: const EdgeInsets.all(kDefultPadding),
        decoration: const BoxDecoration(
            color: Color(0xffF2F4F5),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
              bottomLeft: Radius.circular(20),
            )),
        child: Text(massege),
      ),
    );
  }
}
