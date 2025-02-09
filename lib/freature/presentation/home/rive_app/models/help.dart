import 'package:flutter/material.dart';

import '../home.dart';

void main() {
  runApp(const HelpCenterApp());
}

class HelpCenterApp extends StatelessWidget {
  const HelpCenterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HelpCenterPage(),
    );
  }
}

class HelpCenterPage extends StatelessWidget {
  final List<Map<String, dynamic>> helpItems = [
    {
      "title": "Retina Image Analysis",
      "questions": [
        {
          "question": "How do I upload retina images?",
          "answer":
              "To upload retina images, go to the 'Detect Image' section from the homepage. You can either capture an image using your camera or upload one from your gallery. Make sure the image is clear and well-lit for accurate analysis."
        },
        {
          "question": "What conditions can the model detect?",
          "answer":
              "The model can detect various conditions like diabetic retinopathy, macular degeneration, and other retinal diseases. If any signs of abnormality are detected, you will be advised to consult a doctor."
        },
      ],
    },
    {
      "title": "Detecting Early Signs",
      "questions": [
        {
          "question": "What data is analyzed for predictions?",
          "answer":
              "The app uses retina images and other uploaded health data to predict early signs of eye diseases. The AI model is trained to spot subtle indicators of potential issues."
        },
        {
          "question": "How do I check for early signs?",
          "answer":
              "Upload your retina image in the 'Detect Image' section. The app will process the image and provide a detailed report highlighting any early signs of disease."
        },
      ],
    },
    {
      "title": "Personalized Recommendations",
      "questions": [
        {
          "question": "What type of recommendations does the app provide?",
          "answer":
              "The app offers recommendations based on your health data, including protective eye products, lifestyle tips, nearby specialists, and eye exercises."
        },
        {
          "question": "How do I access my personalized suggestions?",
          "answer":
              "After completing an analysis or test, your personalized recommendations will appear on the results page. You can also access them anytime from the 'Recommendations' section in the app."
        },
      ],
    },
    {
      "title": "Using the Voice Assistant",
      "questions": [
        {
          "question": "How do I activate the voice assistant?",
          "answer":
              "You can activate the voice assistant by tapping the microphone icon available on the homepage or help center. Speak your query clearly, and the assistant will provide an appropriate response."
        },
        {
          "question": "What commands can I use?",
          "answer":
              "You can use commands like:\n- 'What are the symptoms of cataracts?'\n- 'Book an appointment with a doctor.'\n- 'Show me tips for improving my vision.'"
        },
      ],
    },
    {
      "title": "Visual Acuity Test",
      "questions": [
        {
          "question": "How do I prepare for the test?",
          "answer":
              "Ensure you are in a well-lit room and position yourself at the recommended distance from your device screen. Follow the on-screen instructions for accurate results."
        },
        {
          "question": "How do I interpret the results?",
          "answer":
              "The app will display your visual acuity results in a clear format, such as '20/20 vision.' If your results indicate any issues, the app will recommend consulting a specialist."
        },
      ],
    },
    {
      "title": "Using the AI Chatbot",
      "questions": [
        {
          "question": "How do I access the chatbot?",
          "answer":
              "Tap on the 'Chatbot' option in the app. Choose whether you want assistance as a user or a doctor. You can then type or speak your queries."
        },
        {
          "question": "What kind of questions can I ask?",
          "answer":
              "As a user, you can ask general eye care questions like 'How can I reduce eye strain?' or 'What are the symptoms of dry eyes?'. For doctors, the chatbot can assist in interpreting user reports or providing treatment suggestions."
        },
      ],
    },
    {
      "title": "Booking Doctor",
      "questions": [
        {
          "question": "How do I book an appointment?",
          "answer":
              "Go to the 'Find Doctor' section in the app. Select the type of specialist you need, choose a doctor, and pick a suitable time slot. Confirm your appointment by providing the required details."
        },
        {
          "question": "Can I cancel an appointment?",
          "answer":
              "Yes, you can cancel an appointment by going to the 'My Appointments' section. Select the appointment you want to cancel and follow the on-screen instructions."
        },
      ],
    },
  ];

  HelpCenterPage({super.key});

  // Function to go back to the HomePage
  // ignore: unused_element
  void _goToHome(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
          builder: (context) => HelpCenterPage()), // Navigate to home
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Help Center',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      const RiveAppHome()), // Redirect to the HomePage (or HelpCenterPage)
            );
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search bar
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    blurRadius: 8.0,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: const TextField(
                decoration: InputDecoration(
                  hintText: 'I have an issue with',
                  border: InputBorder.none,
                  hintStyle: TextStyle(color: Colors.grey),
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Help items
            Expanded(
              child: ListView.separated(
                itemCount: helpItems.length,
                separatorBuilder: (context, index) => const Divider(height: 1),
                itemBuilder: (context, index) {
                  final item = helpItems[index];
                  return ListTile(
                    title: Text(
                      item["title"],
                      style: const TextStyle(fontSize: 16.0),
                    ),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HelpDetailPage(
                            title: item["title"],
                            questions: item["questions"],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HelpDetailPage extends StatelessWidget {
  final String title;
  final List<Map<String, String>> questions;

  const HelpDetailPage(
      {required this.title, required this.questions, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          style: const TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      HelpCenterPage()), // Go back to the home page
            );
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.separated(
          itemCount: questions.length,
          separatorBuilder: (context, index) => const SizedBox(height: 16),
          itemBuilder: (context, index) {
            final question = questions[index];
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  question["question"]!,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16.0),
                ),
                const SizedBox(height: 8),
                Text(
                  question["answer"]!,
                  style: const TextStyle(fontSize: 14.0, color: Colors.grey),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
