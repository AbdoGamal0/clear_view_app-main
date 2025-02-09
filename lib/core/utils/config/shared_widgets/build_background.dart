import 'package:flutter/material.dart';

class BuildBackground extends StatelessWidget {
  const BuildBackground({super.key, required this.size});

  final Size size;
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: -175,
      left: -75,
      child: Container(
        width: size.width * .7,
        height: size.height * .7,
        decoration: const BoxDecoration(
            shape: BoxShape.circle,
            // color: Colors.blue.withOpacity(0.2),
            gradient: LinearGradient(
                colors: [Color(0xff90C6DD), Color(0xff536184)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter)),
      ),
    );
  }
}
