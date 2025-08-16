import 'package:drips_water/widgets/colors.dart';
import 'package:flutter/material.dart';
import 'package:dialog_flowtter/dialog_flowtter.dart';
import 'package:flutter/services.dart' as services;
import 'package:google_fonts/google_fonts.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  late DialogFlowtter dialogFlowtter;
  final TextEditingController _controller = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  List<Map<String, dynamic>> messages = [];
  bool isTyping = false;

  final Color userColor = const Color(0xff3FBDF1);
  final Color botColor = const Color(0xffF1F1F1);

  @override
  void initState() {
    super.initState();
    DialogFlowtter.fromFile(path: "assets/dialog_flow_auth.json")
        .then((instance) {
      dialogFlowtter = instance;
    });
  }

  void sendMessage(String text) async {
    if (text.isEmpty) return;
    setState(() {
      messages.add({'text': text, 'isUserMessage': true});
      isTyping = true;
    });
    _scrollToBottom();

    DetectIntentResponse response = await dialogFlowtter.detectIntent(
      queryInput: QueryInput(text: TextInput(text: text)),
    );

    if (response.message != null && response.message!.text != null) {
      setState(() {
        messages.add(
            {'text': response.message!.text!.text![0], 'isUserMessage': false});
        isTyping = false;
      });
      _scrollToBottom();
    }

    _controller.clear();
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  @override
  void dispose() {
    dialogFlowtter.dispose();
    _controller.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    services.SystemChrome.setSystemUIOverlayStyle(
      const services.SystemUiOverlayStyle(
        statusBarColor: Color(0xffE3F2FD),
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
      ),
    );
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: const Color(0xffE3F2FD),
        body: SafeArea(
          child: Stack(
            children: [
              Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(16),
                    child: const Row(
                      children: [
                        Icon(Icons.android, color: Colors.blue),
                        SizedBox(width: 10),
                        Text(
                          "Drips Chatbot",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Spacer(),
                        Icon(Icons.circle, size: 12, color: Colors.lightGreen),
                        SizedBox(width: 4),
                        Text("Online"),
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      controller: _scrollController,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 10),
                      itemCount: messages.length + (isTyping ? 1 : 0),
                      itemBuilder: (context, index) {
                        if (isTyping && index == messages.length) {
                          return Row(
                            children: [
                              const CircleAvatar(
                                radius: 14,
                                child: Icon(Icons.android, size: 16),
                              ),
                              const SizedBox(width: 8),
                              Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: botColor,
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: const BouncingDots(),
                              ),
                            ],
                          );
                        }

                        final msg = messages[index];
                        final isUser = msg['isUserMessage'];
                        return Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: isUser
                              ? MainAxisAlignment.end
                              : MainAxisAlignment.start,
                          children: [
                            if (!isUser)
                              const Padding(
                                padding: EdgeInsets.only(right: 8.0),
                                child: CircleAvatar(
                                  radius: 14,
                                  backgroundColor: Colors.white,
                                  child:
                                      Icon(Icons.android, color: Colors.blue),
                                ),
                              ),
                            Flexible(
                              child: Container(
                                margin: const EdgeInsets.symmetric(vertical: 6),
                                padding: const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 14),
                                decoration: BoxDecoration(
                                  color: isUser ? userColor : botColor,
                                  borderRadius: BorderRadius.only(
                                    topLeft: const Radius.circular(16),
                                    topRight: const Radius.circular(16),
                                    bottomLeft:
                                        Radius.circular(isUser ? 16 : 0),
                                    bottomRight:
                                        Radius.circular(isUser ? 0 : 16),
                                  ),
                                ),
                                child: Text(
                                  msg['text'] ?? '',
                                  style: TextStyle(
                                    color:
                                        isUser ? Colors.white : Colors.black87,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 80),
                ],
              ),
              Positioned(
                bottom: 20,
                left: 12,
                right: 12,
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 4),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 6,
                              offset: Offset(0, 2),
                            )
                          ],
                        ),
                        child: TextField(
                          cursorColor: userColor,
                          controller: _controller,
                          decoration: InputDecoration(
                            hintText: "Write your message...",
                            hintStyle: GoogleFonts.poppins(color: blackColor),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: userColor,
                      ),
                      child: IconButton(
                        icon: const Icon(Icons.send, color: Colors.white),
                        onPressed: () => sendMessage(_controller.text),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class BouncingDots extends StatefulWidget {
  const BouncingDots({super.key});

  @override
  State<BouncingDots> createState() => _BouncingDotsState();
}

class _BouncingDotsState extends State<BouncingDots>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late List<Animation<double>> animations;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        duration: const Duration(milliseconds: 1000), vsync: this)
      ..repeat();

    animations = List.generate(3, (index) {
      return Tween<double>(begin: 0, end: -6).animate(
        CurvedAnimation(
          parent: _controller,
          curve:
              Interval(index * 0.2, 0.6 + index * 0.2, curve: Curves.easeInOut),
        ),
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(3, (index) {
        return AnimatedBuilder(
          animation: animations[index],
          builder: (context, child) {
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 2),
              transform:
                  Matrix4.translationValues(0, animations[index].value, 0),
              child: const Dot(),
            );
          },
        );
      }),
    );
  }
}

class Dot extends StatelessWidget {
  const Dot({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 8,
      width: 8,
      decoration: const BoxDecoration(
        color: Colors.grey,
        shape: BoxShape.circle,
      ),
    );
  }
}
