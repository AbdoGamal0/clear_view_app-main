import 'package:flutter/material.dart';

import '../../auth/presentation/widgets/custom_text_field.dart';
import 'widgets/custom_app_bar.dart';
import 'widgets/reciver_chat_bubble.dart';
import 'widgets/sender_chat_bubble.dart';

class Chatbot extends StatefulWidget {
  const Chatbot({super.key});
  static String routeName = '/homechatbot';

  @override
  ChatbotState createState() => ChatbotState();
}

class ChatbotState extends State<Chatbot> {
  final TextEditingController chatController = TextEditingController();
  final ScrollController scrollController = ScrollController();

  @override
  void dispose() {
    chatController.dispose();
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          children: [
            Flexible(
              child: ListView.builder(
                controller: scrollController,
                reverse: true,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return const Column(
                    children: [
                      ReciverChatBubble(
                        massege: 'Hi, I\'m fine and you?',
                      ),
                      SenderChatBubble(
                        massege: 'Hi, How can I help you?',
                      ),
                    ],
                  );
                },
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: CustomTextField(
                    controller: chatController,
                    hintText: 'Type your question here...',
                    labelText: 'Ask',
                  ),
                ),
                const SizedBox(width: 8),
                IconButton(
                  onPressed: () {
                    if (chatController.text.isNotEmpty) {
                      scrollController.animateTo(
                        0,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeIn,
                      );
                      setState(() {});
                    }
                  },
                  icon: Image.asset('assets/images/send.png'),
                ),
              ],
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
