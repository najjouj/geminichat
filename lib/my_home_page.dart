import 'package:flutter/material.dart';
import 'package:geminichat/message.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Message> _messages = [
    Message(isUser: true, text: "hi"),
    Message(isUser: false, text: "Hello, what('s up?)"),
    Message(isUser: true, text: 'Great and you?'),
    Message(isUser: false, text: "I'm excellent")
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: _messages.length,
                itemBuilder: (context, index) {
                  final message = _messages[index];
                  return ListTile(
                    title: Align(
                      alignment: message.isUser ? Alignment.centerRight:Alignment.centerLeft,
                      child: Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color:message.isUser? Colors.blue:Colors.grey[300],
                      
                          borderRadius: message.isUser ? BorderRadius.only(
                            topLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                            bottomLeft: Radius.circular(20)
                          ):BorderRadius.only(
                            topRight: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                            bottomLeft: Radius.circular(20)
                          )
                        ),
                        child: Text(message.text,
                        style: TextStyle(
                          color: message.isUser? Colors.white: Colors.black
                        ),
                        )),
                    ),
                  );
                }),
          ),
          //user input 
        ],
      ),
    );
  }
}
