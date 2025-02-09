import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class DetectDiseasePage extends StatefulWidget {
  static const routeName = '/detect-disease';

  const DetectDiseasePage({super.key});
  @override
  DetectDiseasePageState createState() => DetectDiseasePageState();
}

class DetectDiseasePageState extends State<DetectDiseasePage> {
  XFile? _image; // Store the selected image
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage() async {
    final XFile? pickedFile =
        await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = pickedFile;
    });
  }

  // Function to show the bottom sheet with the result
  void _showResult(String result) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Padding(
          padding: EdgeInsets.all(40.0),
          child: SizedBox(
            width: MediaQuery.of(context).size.width, // عرض الصفحة الكامل
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  result,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context); // Close the bottom sheet
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF7AA3FF),
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 60),
                  ),
                  child: const Text(
                    'Close',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detect Image'),
      ),
      body: Stack(
        children: [
          // الدائرة العلوية على الشمال
          Positioned(
            top: -150,
            left: -150,
            child: Container(
              height: 390,
              width: 390,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  colors: [
                    const Color(0xFF536184), // اللون الأول
                    const Color(0xFF90C6DD), // اللون الثاني
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
            ),
          ),
          // باقي الصفحة
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // ClipOval للصورة
                Padding(
                  padding: const EdgeInsets.only(top: 1), // رفع الدائرة للأعلى
                  child: ClipOval(
                    child: Container(
                      height: 300,
                      width: 300,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            const Color(0xFF536184),
                            const Color(0xFF90C6DD),
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                      ),
                      child: _image != null
                          ? (kIsWeb
                              ? Image.network(
                                  _image!.path) // استخدم Image.network في الويب
                              : Image.file(
                                  File(_image!.path),
                                  fit: BoxFit.cover,
                                ))
                          : Image.asset(
                              'assets/images/images2/img.png', // ضع هنا مسار الصورة الافتراضية
                              fit: BoxFit.cover,
                            ),
                    ),
                  ),
                ),
                const SizedBox(height: 50),
                // زرار Upload
                ElevatedButton(
                  onPressed: _pickImage,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF7AA3FF),
                    minimumSize: const Size(300, 60), // حجم الزر الكبير
                    foregroundColor: Colors.white, // لون النص
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30), // زوايا مستديرة
                    ),
                  ),
                  child: const Text(
                    'Upload Image',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                const SizedBox(height: 20),
                // زرار للـ Function الثانية
                ElevatedButton(
                  onPressed: () {
                    if (_image == null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                            'Please upload an image first!',
                            style: TextStyle(color: Colors.red),
                          ),
                          duration: Duration(seconds: 2),
                        ),
                      );
                    } else {
                      // هنا يمكن إضافة منطق التعرف على الصورة
                      // في حال كانت الصورة تحتوي على النتيجة المعروفة
                      String result = 'Error: Can’t recognize image';
                      // إذا كانت الصورة تحتوي على مرض معين مثل:
                      // result = 'Diabetic Retinopathy';

                      // عرض النتيجة
                      _showResult(result);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF7AA3FF),
                    minimumSize: const Size(300, 60), // حجم الزر الكبير
                    foregroundColor: Colors.white, // لون النص
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30), // زوايا مستديرة
                    ),
                  ),
                  child: const Text(
                    'Detect Image',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
