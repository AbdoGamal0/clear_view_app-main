import 'package:flutter/material.dart';

import '../../../../../core/utils/config/constants.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);

    return Container(
      margin: EdgeInsets.symmetric(vertical: size.height * .02),
      width: size.width * .6,
      child: Row(
        children: [
          buildDivider(),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              'Or sign in with',
              textAlign: TextAlign.center,
              style:
                  TextStyle(color: kPrimaryColor, fontWeight: FontWeight.w600),
            ),
          ),
          buildDivider(),
        ],
      ),
    );
  }
}

Expanded buildDivider() {
  return const Expanded(
      child: Divider(
    color: Color(0xffD9D9D9),
    height: 2,
    thickness: 1.5,
  ));
}
