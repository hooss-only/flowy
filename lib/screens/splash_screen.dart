import 'package:flowy/widgets/gradient_text.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  final Gradient signitureGradient = const LinearGradient(
    colors: [
      Color(0xFF58BC46),
      Color(0xFFBBD66C),
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            GradientText(
              text: "FLOWY",
              style: TextStyle(
                fontSize: 58,
                fontFamily: "Pretendard",
                fontWeight: FontWeight.w900,
              ),
              gradient: LinearGradient(
                colors: [
                  Color(0xFF58BC46),
                  Color(0xFFBBD66C),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
