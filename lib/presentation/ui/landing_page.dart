import 'package:flutter/material.dart';
import 'package:learn_basic_flutter/presentation/widgets/landing_card_image.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          "this is landing page",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white
          ),
        ),
      ),
      body: const Column(
        children: [
          LandingCardImage()
        ],
      )
    );
  }
}