import 'package:flowy/screens/main_screen.dart';
import 'package:flowy/widgets/gradient_elevated_button.dart';
import 'package:flowy/widgets/gradient_text.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Signup2Screen extends StatefulWidget {
  const Signup2Screen({super.key});

  @override
  State<Signup2Screen> createState() => _Signup2ScreenState();
}

class _Signup2ScreenState extends State<Signup2Screen> {
  late SharedPreferences preferences;
  final nicknameController = TextEditingController();

  Future<void> initPref() async {
    preferences = await SharedPreferences.getInstance();
  }

  @override
  void initState() {
    super.initState();

    initPref();
  }

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
            SizedBox(
              width: 320,
              child: Column(
                children: [
                  const SizedBox(
                    height: 169,
                  ),
                  TextField(
                    controller: nicknameController,
                    cursorColor: Colors.grey,
                    decoration: const InputDecoration(
                      labelText: '닉네임',
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xFFBBD66C),
                        ),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xFF58BC46),
                          width: 2,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 169,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 118,
            ),
            GradientElevatedButton(
              onPressed: () {
                if (nicknameController.text.isNotEmpty) {
                  preferences.setString("username", nicknameController.text);
                  preferences.setBool("sign up", true);
                  Navigator.pushNamedAndRemoveUntil(context, '/', (_) => false);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const MainScreen()),
                  );
                }
              },
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
