import 'package:flutter/material.dart';

import '../chat/presentation/chatbot_onboarding/onboarding_chatbot.dart';
import '../detectimage/detect_disease_page.dart';
import '../find_doctor/ListOfDoctor.dart';
import '../vision_test/onboarding_vision_test/onboarding_vision_test.dart';
import 'rive_app/navigation/main_page.dart';

// import '../../../detectimage/themeofdetectimage.dart';
// import '../../../find_doctor/ListOfDoctor.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static String routeName = '/home_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFDFDFD), // لون الصفحة بالكامل
      body: SingleChildScrollView(
        // لجعل الصفحة قابلة للتمرير
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // النصوص على اليسار
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Welcome',
                        style: TextStyle(
                          fontFamily: 'RalewayRomanMedium',
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF677294), // لون النص
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Donna Troy',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  // الصورة في أعلى اليمين
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Image.asset(
                        'assets/images/wav.jpg',
                        width: 120,
                        height: 120,
                        fit: BoxFit.cover,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const DetectDiseasesPage(),
                            ),
                          );
                        },
                        child: Image.asset(
                          'assets/images/images2/img_image.png',
                          width: 110,
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 16),
              // المستطيل مع النصوص والصورة
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: const Color(0xFF90B4CE),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Know your disease is available',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          'Get free\nconsultation for\nnew users',
                          style: TextStyle(
                            fontFamily: 'RalewayRomanRegular',
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 16),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const DetectDiseasesResultPage(),
                              ),
                            );
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 24, vertical: 12),
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                colors: [
                                  Color(0xFF3DA9FC),
                                  Color(0xFF8175D8),
                                ],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: const Text(
                              'Find a doctor',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    right: -80,
                    top: -50,
                    child: Image.asset(
                      'assets/images/images2/img_smiling_asian_d.png',
                      width: 250,
                      height: 250,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              // النص "Our Services"
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Our Services',
                  style: TextStyle(
                    color: Color(0xFF094067),
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              // صف الأيقونات داخل مربعات
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButtonWithText(
                    imagePath: 'assets/images/images2/img_vector.png',
                    text: 'Detect diseases',
                    backgroundColor: const Color(0xFFDFEFFC),
                    onTap: () {
                      Navigator.pushNamed(context, DetectDiseasePage.routeName);
                    },
                  ),
                  IconButtonWithText(
                    imagePath: 'assets/images/images2/img_vector_28x32.png',
                    text: 'Find doctor',
                    backgroundColor: const Color(0xFFFDF3F3),
                    onTap: () {
                      Navigator.pushNamed(
                          context, DoctorsListingPage.routeName);
                    },
                  ),
                  IconButtonWithText(
                    imagePath: 'assets/images/images2/img_image.png',
                    text: 'Chatbot',
                    backgroundColor: const Color(0xFFF5EDC1),
                    onTap: () {
                      Navigator.pushNamed(context, ChatbotOnboarding.routeName);
                    },
                  ),
                  IconButtonWithText(
                    imagePath: 'assets/images/images2/img_vector_32x32.png',
                    text: 'Vision test',
                    backgroundColor: const Color(0xFFD0F6D8),
                    onTap: () {
                      Navigator.pushNamed(
                          context, OnboardingVisionTest.routeName);
                    },
                  ),
                ],
              ),
              const SizedBox(height: 16),
              // كلمة "Appointments"
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Appointments',
                  style: TextStyle(
                    color: Color(0xFF094067),
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              // مستطيل يحتوي على تفاصيل الموعد
              const AppointmentCard(),
              const AppointmentCard(), // تكرار للمستطيل
            ],
          ),
        ),
      ),
    );
  }
}

// ويدجيت خاص بالأيقونات مع النص
class IconButtonWithText extends StatelessWidget {
  final String imagePath;
  final String text;
  final Color backgroundColor;
  final VoidCallback onTap;

  const IconButtonWithText({
    super.key,
    required this.imagePath,
    required this.text,
    required this.backgroundColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 80,
        height: 80,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              imagePath,
              width: 32,
              height: 32,
            ),
            const SizedBox(height: 8),
            Text(
              text,
              style: const TextStyle(
                color: Colors.black, // تغيير اللون إلى الأسود
                fontSize: 12,
                fontWeight: FontWeight.bold, // جعل النص بالخط العريض
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

class AppointmentCard extends StatelessWidget {
  const AppointmentCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white, // لون الخلفية
        borderRadius: BorderRadius.circular(12), // حواف دائرية
        boxShadow: [
          BoxShadow(
            // ignore: deprecated_member_use
            color: Colors.grey.withOpacity(0.1), // ظل خفيف
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // النصوص العلوية
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Appointment date',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                      color: Colors.grey, // لون رمادي للنص
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    '08:00  ➔  09:00',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.red, // لون أحمر للنص
                    ),
                  ),
                ],
              ),
              Text(
                'Wed Jun 20',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                  color: Color(0xFF094067), // لون أحمر للنص
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Divider(
            color: Colors.grey.shade300, // فاصل بلون رمادي فاتح
            thickness: 1,
          ),
          const SizedBox(height: 8),
          // بيانات الطبيب
          Row(
            children: [
              // صورة الطبيب
              ClipRRect(
                borderRadius: BorderRadius.circular(25), // يجعل الصورة دائرية
                child: Image.asset(
                  'assets/images/images2/img_user.png', // استبدل بالصورة المطلوبة
                  width: 40,
                  height: 40,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 12),
              // اسم الطبيب
              const Text(
                'Dr. Indah Kusumaningrum',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                  color: Color(0xFF094067), // لون أزرق للنص
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class DetectDiseasesResultPage extends StatelessWidget {
  const DetectDiseasesResultPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Detect Diseases')),
      body: const Center(child: Text('Detect Diseases Page')),
    );
  }
}
