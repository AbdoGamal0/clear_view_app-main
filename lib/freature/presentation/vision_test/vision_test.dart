import 'package:flutter/material.dart';

class VisionTest extends StatelessWidget {
  const VisionTest({super.key});
  static String routeName = '/vision_test';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(flex: 1),
          Image.asset('assets/images/vision_test_check.png'),
          const Spacer(flex: 2),
          IconButton(
            onPressed: () {},
            icon: Image.asset('assets/images/InputVoice.png'),
          ),
          const Text('Tap here and\nstart speaking'),
          const Spacer(flex: 1),
        ],
      ),
    ));
  }
}
