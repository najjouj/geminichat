import 'package:flutter/material.dart';
import 'package:geminichat/my_home_page.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 32),
            child: Column(
              children: [
                Text(
                  "You AI Assisstant",
                  style: TextStyle(
                      color: Colors.blue,
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 16,
                ),
                Text(
                    'Google AI Studio is the fastest way to start building with Gemini, our next generation family of multimodal generative AI models.',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16, color: Colors.black54))
              ],
            ),
          ),
          Image.network(
              "https://img.freepik.com/free-vector/cute-friendly-robot-with-welcome-speech-bubble_107791-29910.jpg?semt=ais_hybrid&w=740"),
          ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MyHomePage()));
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Continue",
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Icon(
                    Icons.forward,
                    color: Colors.white,
                  )
                ],
              ))
        ],
      ),
    );
  }
}
