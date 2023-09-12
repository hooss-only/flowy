import 'package:flowy/screens/signup/signup2_screen.dart';
import 'package:flowy/widgets/gradient_elevated_button.dart';
import 'package:flowy/widgets/gradient_text.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Signup1Screen extends StatefulWidget {
  const Signup1Screen({super.key});

  @override
  State<Signup1Screen> createState() => _Signup1ScreenState();
}

class _Signup1ScreenState extends State<Signup1Screen> {
  late SharedPreferences preferences;
  final gradeController = TextEditingController();
  final classController = TextEditingController();

  Future<void> initPrefs() async {
    preferences = await SharedPreferences.getInstance();
  }

  @override
  void initState() {
    super.initState();
    initPrefs();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 33, horizontal: 54),
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
                    TextField(
                      controller: gradeController,
                      cursorColor: Colors.grey,
                      decoration: const InputDecoration(
                        labelText: '학년',
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
                      height: 68,
                    ),
                    TextField(
                      controller: classController,
                      cursorColor: Colors.grey,
                      decoration: const InputDecoration(
                        labelText: '반',
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
                  ],
                ),
              ),
              const SizedBox(
                height: 118,
              ),
              GradientElevatedButton(
                onPressed: () {
                  if (gradeController.text.isNotEmpty ||
                      classController.text.isNotEmpty) {
                    preferences.setString('grade', gradeController.text);
                    preferences.setString('class', classController.text);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => (const Signup2Screen()),
                        fullscreenDialog: true,
                      ),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text("학년 / 반을 모두 기입하여주세요."),
                    ));
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
      ),
    );
  }
}
