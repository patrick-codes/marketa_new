import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:marketa_new/helpers/color/colors.dart';
import 'package:marketa_new/helpers/widgets/custom_textform_field.dart';
import '../../helpers/widgets/custom_appbar.dart';

class ChatbotScreen extends StatefulWidget {
  const ChatbotScreen({super.key});

  @override
  State<ChatbotScreen> createState() => _ChatbotScreenState();
}

class _ChatbotScreenState extends State<ChatbotScreen> {
  String apiKey = "AIzaSyC-pSfBcBi7AVbf5nlMC8cFfP-YuEDy9HE";
  final List<String> suggestions = const [
    "How can I get more customers to notice my products?",
    "What’s the best way to promote new arrivals?",
    "How do I grow my sales as a small business owner?"
  ];

  final TextEditingController _controller = TextEditingController();
  List<Map<String, String>> chat = [];
  String? errorMessage;
  bool isLoading = false;
  final node = FocusNode();

  @override
  void initState() {
    super.initState();
    chat.add({
      "role": "bot",
      "message":
          "👋 Welcome to MarketaBot! I'm here to help you grow your business, promote your products, and boost your sales. Ask me anything related to selling online or running your shop.",
    });
  }

  Future<void> sendMessage(String text) async {
    setState(() {
      isLoading = true;
      errorMessage = null;
      chat.add({"role": "user", "message": text});
    });

    try {
      final model = GenerativeModel(
        model: "gemini-2.0-flash",
        apiKey: apiKey,
        systemInstruction: Content.system(
          "You are a professional ecommerce business assistant for sellers on Marketa. Only respond to questions related to business growth, marketing strategies, product promotion, and online selling. Keep responses concise, practical, and easy to apply. If a question is unrelated to business, ecommerce, or product marketing, politely inform the user that you are only able to assist with business-related queries.",
        ),
      );

      final content = [Content.text(text)];
      final response = await model.generateContent(content);

      setState(() {
        chat.add({"role": "bot", "message": response.text ?? "No response."});
      });
    } catch (e) {
      setState(() {
        errorMessage = "Failed to connect: ${e.toString()}";
      });
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: CustomAppBar(
          title: 'MarketaBot',
          bgColor: primaryColor,
          textColor: whiteColor,
        ),
      ),
      bottomSheet: Container(
        height: 80,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: whiteColor,
          border: Border.all(color: outlineGrey),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: textFormField(
                      context,
                      'How can I help you?',
                      MingCute.chat_1_fill,
                      TextInputType.text,
                      node,
                      _controller,
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(
                    MingCute.send_fill,
                    size: 30,
                    color: primaryColor,
                  ),
                  onPressed: isLoading
                      ? null
                      : () {
                          final text = _controller.text.trim();
                          if (text.isNotEmpty) {
                            _controller.clear();
                            sendMessage(text);
                          }
                        },
                ),
              ],
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            if (isLoading)
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: SpinKitChasingDots(
                  size: 20,
                  color: primaryColor,
                ),
              ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Expanded(
                    flex: 2,
                    child: ListView.builder(
                      itemCount: chat.length,
                      itemBuilder: (_, index) {
                        final isUser = chat[index]["role"] == "user";
                        return Align(
                          alignment: isUser
                              ? Alignment.centerRight
                              : Alignment.centerLeft,
                          child: Container(
                            margin: const EdgeInsets.symmetric(
                                vertical: 4, horizontal: 8),
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color:
                                  isUser ? Colors.blue[100] : Colors.grey[300],
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text(chat[index]["message"] ?? ""),
                          ),
                        );
                      },
                    ),
                  ),
                  if (errorMessage != null)
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(errorMessage!,
                          style: const TextStyle(color: Colors.red)),
                    ),

                  // if (suggestions.isNotEmpty)
                  //   SizedBox(
                  //     height: 40,
                  //     child: ListView.separated(
                  //       scrollDirection: Axis.horizontal,
                  //       padding: const EdgeInsets.symmetric(horizontal: 8),
                  //       itemCount: suggestions.length,
                  //       separatorBuilder: (_, __) => const SizedBox(width: 8),
                  //       itemBuilder: (context, index) {
                  //         return ActionChip(
                  //           backgroundColor: primaryContainerShade,
                  //           label: Text(suggestions[index]),
                  //           onPressed: isLoading
                  //               ? null
                  //               : () {
                  //                   sendMessage(suggestions[index]);
                  //                 },
                  //         );
                  //       },
                  //     ),
                  //   ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
