class Onboard {
  final String image;
  final String headline;
  final String desc;

  dynamic controller;
  Onboard({
    required this.image,
    required this.headline,
    required this.desc,
  });
}

List<Onboard> onboardData = [
  Onboard(
    image: 'assets/images/save_doctor.png',
    headline: 'Welcome',
    desc: 'Welcome to Clear View',
  ),
  Onboard(
    image: 'assets/images/eye_detect.png',
    headline: 'Detect your eye disease',
    desc:
        'in this app we provide\nyou a detect for your eye\n disease (like Glaucoma)',
  ),
  Onboard(
    image: 'assets/images/test_vision.png',
    headline: 'eye test',
    desc: 'also,you can test for your\n        eye vision ',
  ),
  Onboard(
    image: 'assets/images/helpful_tips.png',
    headline: 'save your sight',
    desc: 'we add some tips in our\n app to save your sight  ',
  )
];
