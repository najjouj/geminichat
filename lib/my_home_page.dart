import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geminichat/message.dart';
import 'package:geminichat/theme_notifier.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

class MyHomePage extends ConsumerStatefulWidget {
  const MyHomePage({super.key});

  @override
  ConsumerState<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends ConsumerState<MyHomePage> {
  final TextEditingController _inputController = TextEditingController();
  final List<Message> _messages = [
    Message(isUser: true, text: "hi"),
    Message(isUser: false, text: "Hello, what('s up?)"),
    Message(isUser: true, text: 'Great and you?'),
    Message(isUser: false, text: "I'm excellent")
  ];
  callGeminiModel() async {
    try {
      if (_inputController.text.isNotEmpty) {
        _messages.add(Message(isUser: true, text: _inputController.text));
      }
      final model = GenerativeModel(
          apiKey: dotenv.env["GOOGLE_API_KEY"]!, model: "gemini-1.5-flash");

      final prompt = _inputController.text.trim();
      print(prompt);
      final content = [Content.text(prompt)];

      final response = await model.generateContent(content);

      setState(() {
        _messages.add(Message(isUser: false, text: response.text!));
      });
      _inputController.clear();
    } catch (e) {
      print("gemini generative model error:$e");
    }
  }

  @override
  Widget build(BuildContext context) {
    final currentTheme = ref.read(themeProvider);
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: Theme.of(context).colorScheme.background,
        elevation: 1,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                    //padding: EdgeInsets.all(3),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.grey.shade300)),
                    child: Image.network(
                      "https://static.vecteezy.com/system/resources/thumbnails/027/730/658/small/technology-robot-generative-ai-free-png.png",
                      width: 40,
                      height: 40,
                    )),
                SizedBox(
                  width: 5,
                ),
                Text(
                  "Gemini Gpt",
                  style: Theme.of(context).textTheme.titleLarge,
                )
              ],
            ),
            IconButton(
                icon: (currentTheme == ThemeMode.light)
                    ? const Icon(Icons.dark_mode)
                    : const Icon(Icons.light_mode),
                onPressed: () {
                  ref.read(themeProvider.notifier).toggleTheme();
                },
                color: Colors.blue)
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: _messages.length,
                itemBuilder: (context, index) {
                  final message = _messages[index];
                  return ListTile(
                    title: Align(
                      alignment: message.isUser
                          ? Alignment.centerRight
                          : Alignment.centerLeft,
                      child: Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: message.isUser
                                  ? Theme.of(context).colorScheme.primary
                                  : Theme.of(context).colorScheme.secondary,
                              borderRadius: message.isUser
                                  ? BorderRadius.only(
                                      topLeft: Radius.circular(20),
                                      bottomRight: Radius.circular(20),
                                      bottomLeft: Radius.circular(20))
                                  : BorderRadius.only(
                                      topRight: Radius.circular(20),
                                      bottomRight: Radius.circular(20),
                                      bottomLeft: Radius.circular(20))),
                          child: Text(
                            message.text,
                            style: TextStyle(
                                color: message.isUser
                                    ? Colors.white
                                    : Colors.black),
                          )),
                    ),
                  );
                }),
          ),
          //user input
          Padding(
            padding: const EdgeInsets.only(bottom: 32, top: 16, right: 16),
            child: Container(
              margin: EdgeInsets.only(left: 10),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(32),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(.1),
                        spreadRadius: 5,
                        offset: Offset(0, 3))
                  ]),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _inputController,
                      decoration: InputDecoration(
                          hintText: "Write your message",
                          hintStyle: TextStyle(color: Colors.grey),
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(horizontal: 20)),
                    ),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  IconButton(
                      onPressed: () => callGeminiModel(),
                      icon: Icon(
                        Icons.send,
                        color: Colors.blueGrey,
                      ))
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
