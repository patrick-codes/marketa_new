import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:marketa_new/helpers/color/colors.dart';
import 'package:marketa_new/helpers/text style/text_style.dart';

class ChatbotScreen extends StatefulWidget {
  const ChatbotScreen({super.key});

  @override
  State<ChatbotScreen> createState() => _ChatbotScreenState();
}

class _ChatbotScreenState extends State<ChatbotScreen> {
  String apiKey = 'AIzaSyAIQim8N-pnYpfu_JPl9PCg0d7Z3O975B8';

  final TextEditingController _controller = TextEditingController();
  final FocusNode node = FocusNode();
  final ScrollController scrollController = ScrollController();

  List<Map<String, String>> chat = [];
  String? errorMessage;
  bool isLoading = false;

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
          "You are a professional e-commerce business assistant for Marketa. Answer all questions related to business, online selling, retailing, wholesaling, buying, products, delivery, shipping, pricing, quality, and customer experience. Keep responses concise and practical. If unrelated to business, politely say you only assist with marketplace and business queries.",
        ),
      );

      final content = [Content.text(text)];
      final response = await model.generateContent(content);

      setState(() {
        chat.add({"role": "bot", "message": response.text ?? "No response."});
      });

      Future.delayed(const Duration(milliseconds: 300), () {
        scrollController.jumpTo(scrollController.position.maxScrollExtent);
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

  Widget _buildBubble(String message, bool isUser) {
    return Align(
      alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
        padding: const EdgeInsets.all(12),
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.75,
        ),
        decoration: BoxDecoration(
          color: isUser ? Colors.black : Colors.grey.shade200,
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(16),
            topRight: const Radius.circular(16),
            bottomLeft:
                isUser ? const Radius.circular(16) : const Radius.circular(0),
            bottomRight:
                isUser ? const Radius.circular(0) : const Radius.circular(16),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 3,
              offset: const Offset(1, 2),
            ),
          ],
        ),
        child: Text(
          message,
          style: TextStyle(
            color: isUser ? Colors.white : Colors.black,
            fontSize: 13,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          backgroundColor: Colors.white,
          elevation: 1,
          centerTitle: true,
          title: appbarText(context, 'MarketaBot', Colors.black),
          iconTheme: const IconThemeData(color: Colors.black),
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
            left: 12,
            right: 12,
            bottom: MediaQuery.of(context).viewInsets.bottom + 8,
          ),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 6),
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(30),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 6,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Row(
              children: [
                Expanded(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxHeight: 120),
                    child: TextField(
                      controller: _controller,
                      focusNode: node,
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                      ),
                      decoration: const InputDecoration(
                        hintText: "Ask marketa...",
                        hintStyle: TextStyle(
                          color: Colors.black54,
                          fontSize: 15,
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(MingCute.send_fill,
                      size: 28, color: blackColor),
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
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              controller: scrollController,
              padding: const EdgeInsets.all(16),
              itemCount: chat.length,
              itemBuilder: (_, index) {
                final isUser = chat[index]["role"] == "user";
                return _buildBubble(chat[index]["message"] ?? "", isUser);
              },
            ),
          ),
          if (isLoading)
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: SpinKitChasingDots(size: 24, color: Colors.black),
            ),
          if (errorMessage != null)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(errorMessage!,
                  style: const TextStyle(color: Colors.red)),
            ),
        ],
      ),
    );
  }
}
