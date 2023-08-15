import 'package:flowy/screens/signup/signup1_screen.dart';
import 'package:flowy/widgets/gradient_text.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late SharedPreferences preferences;
  final Gradient signitureGradient = const LinearGradient(
    colors: [
      Color(0xFF58BC46),
      Color(0xFFBBD66C),
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  Future<void> initPref() async {
    preferences = await SharedPreferences.getInstance();
  }

  @override
  void initState() {
    super.initState();

    initPref();

    Future.delayed(const Duration(seconds: 3), () {
      bool? signup = preferences.getBool('sign up');

      if (!preferences.containsKey('sign up')) {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => (const Signup1Screen())));
      }

      if (signup != null) {
        if (!signup) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => (const Signup1Screen())));
        }
      } else {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => (const Signup1Screen())));
      }

      Navigator.pop(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
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
