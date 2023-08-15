import 'package:flowy/widgets/gradient_elevated_button.dart';
import 'package:flowy/widgets/gradient_text.dart';
import 'package:flutter/material.dart';

class Signup1Screen extends StatelessWidget {
  const Signup1Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const GradientText(
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
            const SizedBox(
              height: 118,
            ),
            const SizedBox(
              width: 320,
              child: Column(
                children: [
                  TextField(
                    decoration: InputDecoration(
                      labelText: '학년',
                      fillColor: Color(0xFF58BC46),
                    ),
                  ),
                  SizedBox(
                    height: 68,
                  ),
                  TextField(
                    decoration: InputDecoration(
                      labelText: '반',
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 118,
            ),
            GradientElevatedButton(
              onPressed: () {},
              gradient: const LinearGradient(
                colors: [
                  Color(0xFF58BC46),
                  Color(0xFFBBD66C),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              width: 322,
              height: 64,
              borderRadius: BorderRadius.circular(18),
              shadowColor: Colors.black.withOpacity(0.16),
              child: const Text(
                "다음",
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Pretendard',
                  fontSize: 20,
                  fontWeight: FontWeight.w300,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
