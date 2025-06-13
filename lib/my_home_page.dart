import 'package:flutter/material.dart';
import 'package:geminichat/message.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _inputController = TextEditingController();
  final List<Message> _messages = [
    Message(isUser: true, text: "hi"),
    Message(isUser: false, text: "Hello, what('s up?)"),
    Message(isUser: true, text: 'Great and you?'),
    Message(isUser: false, text: "I'm excellent")
  ];
  @override
  Widget build(BuildContext context) {
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
                icon: Icon(Icons.light_mode),
                onPressed: () {},
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
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(horizontal: 20)),
                    ),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  IconButton(
                      onPressed: () {},
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
