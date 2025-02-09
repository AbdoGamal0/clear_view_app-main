import 'package:clear_view/freature/presentation/auth/presentation/widgets/custom_rounded_button.dart';
import 'package:flutter/material.dart';

import '../../../core/utils/config/constants.dart';

class TestVisionResult extends StatelessWidget {
  const TestVisionResult({super.key});
  static String routeName = '/test_vision_result';

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // العناوين
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    'Right Eye',
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  Text(
                    'Left Eye',
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                ],
              ),
              SizedBox(height: size.height * .1),

              // الصور
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CircleAvatar(
                    backgroundImage:
                        AssetImage('assets/images/test_vision_onboard1.png'),
                    radius: 75,
                  ),
                  CircleAvatar(
                    backgroundImage:
                        AssetImage('assets/images/test_vision_onboard1.png'),
                    radius: 75,
                  ),
                ],
              ),
              SizedBox(height: size.height * .03),

              // النتائج
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // SizedBox(width: 0),
                  Text(
                    '5/6',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                  // SizedBox(width: 0),
                  Text(
                    '8/10',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                ],
              ),
              SizedBox(height: size.height * .09),

              // الشرح
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    child: Text(
                      'A visual acuity of 6/48 indicates significant vision impairment. It means that what a person with normal vision can see from 48 meters away.',
                      softWrap: true,
                      // textAlign: TextAlign.center,
                    ),
                  ),
                  Flexible(
                    child: Text(
                      'A visual acuity of 6/48 indicates significant vision impairment. It means that what a person with normal vision can see from 48 meters away.',
                      softWrap: true,
                      // textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
              SizedBox(height: size.height * .1),

              // الزر
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40.0),
                child: CustomRoundedButton(
                  buttonName: 'Repeat Test',
                  press: () {
                    // Add your logic here
                  },
                  color: kPrimaryColor,
                  textColor: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// 'A visual acuity of\n6/48 indicates significant\nvision impairment. It means\nthat what a person with\nnormal vision can see\nfrom 48 meters away.',
