import 'package:flutter/material.dart';


import '../../../freature/presentation/chat/presentation/chatbot.dart';
import '../../../freature/presentation/detectimage/detect_disease_page.dart';
import '../../../freature/presentation/find_doctor/ListOfDoctor.dart';
import '../../../freature/presentation/vision_test/vision_test.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFDFDFD), // لون الصفحة بالكامل
      body: SingleChildScrollView(  // لجعل الصفحة قابلة للتمرير
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // النصوص على اليسار
                  Column(
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
                  Spacer(),
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
                              builder: (context) => Chatbot(), // الصفحة الجديدة
                            ),
                          );
                        },
                        child: Image.asset(
                          'assets/images/img_image.png',
                          width: 110,
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 16),
              // المستطيل مع النصوص والصورة
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Color(0xFF90B4CE),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Know your disease is available',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Get free\nconsultation for\nnew users',
                          style: TextStyle(
                            fontFamily: 'RalewayRomanRegular',
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 16),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetectDiseasesPage(),
                              ),
                            );
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Color(0xFF3DA9FC),
                                  Color(0xFF8175D8),
                                ],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
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
                      'assets/images/img_smiling_asian_d.png',
                      width: 250,
                      height: 250,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              // النص "Our Services"
              Align(
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
              SizedBox(height: 16),
              // صف الأيقونات داخل مربعات
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButtonWithText(
                    imagePath: 'assets/images/img_vector.png',
                    text: 'Detect diseases',
                    backgroundColor: Color(0xFFDFEFFC),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetectDiseasePage(),
                        ),
                      );
                    },
                  ),
                  IconButtonWithText(
                    imagePath: 'assets/images/img_vector_28x32.png',
                    text: 'Find doctor',
                    backgroundColor: Color(0xFFFDF3F3),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DoctorsListingPage(),
                        ),
                      );
                    },
                  ),
                  IconButtonWithText(
                    imagePath: 'assets/images/img_image.png',
                    text: 'Chatbot',
                    backgroundColor: Color(0xFFF5EDC1),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Chatbot(),
                        ),
                      );
                    },
                  ),
                  IconButtonWithText(
                    imagePath: 'assets/images/img_vector_32x32.png',
                    text: 'Vision test',
                    backgroundColor: Color(0xFFD0F6D8),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => VisionTest(),
                        ),
                      );
                    },
                  ),
                ],
              ),
              SizedBox(height: 16),
              // كلمة "Appointments"
              Align(
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
              SizedBox(height: 16),
              // مستطيل يحتوي على تفاصيل الموعد
              AppointmentCard(),
              AppointmentCard(),  // تكرار للمستطيل
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

  IconButtonWithText({
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
            SizedBox(height: 8),
            Text(
              text,
              style: TextStyle(
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
}class AppointmentCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      margin: EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white, // لون الخلفية
        borderRadius: BorderRadius.circular(12), // حواف دائرية
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1), // ظل خفيف
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // النصوص العلوية
          Row(
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
          SizedBox(height: 8),
          Divider(
            color: Colors.grey.shade300, // فاصل بلون رمادي فاتح
            thickness: 1,
          ),
          SizedBox(height: 8),
          // بيانات الطبيب
          Row(
            children: [
              // صورة الطبيب
              ClipRRect(
                borderRadius: BorderRadius.circular(25), // يجعل الصورة دائرية
                child: Image.asset(
                  'assets/images/img_user.png', // استبدل بالصورة المطلوبة
                  width: 40,
                  height: 40,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(width: 12),
              // اسم الطبيب
              Text(
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

class DetectDiseasesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Detect Diseases')),
      body: Center(child: Text('Detect Diseases Page')),
    );
  }
}