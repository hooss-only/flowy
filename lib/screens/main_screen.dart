import 'package:flowy/models/meal_model.dart';
import 'package:flowy/screens/timetable_screen.dart';
import 'package:flowy/services/api_services.dart';
import 'package:flowy/services/utilites.dart';
import 'package:flowy/widgets/card_widget.dart';
import 'package:flowy/widgets/weather_widget.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late SharedPreferences preferences;
  String? username = 'XX';
  String? classnumber = '2';
  String? grade = '1';
  String? weekday = 'X';

  late Future<MealModel> todayMeal;

  Future<void> initPref() async {
    preferences = await SharedPreferences.getInstance();

    if (preferences.containsKey('username')) {
      username = preferences.getString('username');
    }

    if (preferences.containsKey('grade')) {
      grade = preferences.getString('grade');
    }

    if (preferences.containsKey('class')) {
      classnumber = preferences.getString('class');
    }
  }

  @override
  void initState() {
    super.initState();

    todayMeal = ApiService.getTodayMeal();
    weekday = Utilites.getTodayWeekday('ko_KR');

    initPref();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 33, horizontal: 23),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "FLOWY",
                  style: TextStyle(
                    color: Color(0xFF9a9a9a),
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w900,
                    fontSize: 24,
                  ),
                ),
                IconButton(onPressed: () {}, icon: const Icon(Icons.settings))
              ],
            ),
            const SizedBox(
              height: 45,
            ),
            SingleChildScrollView(
              child: Column(
                children: [
                  CardWidget(
                    child: FutureBuilder(
                      future: todayMeal,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          final date = snapshot.data!.date;
                          // 20230823 -> 2023. 08. 23.
                          final dateText =
                              '${date.substring(0, 4)}. ${date.substring(4, 6)}. ${date.substring(6)}.';

                          final meal = snapshot.data!.meals;
                          final mealText = meal.replaceAll('<br/>', '\n');

                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  const Text(
                                    '점심',
                                    style: TextStyle(
                                      fontSize: 24,
                                      fontFamily: 'Pretendard',
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  const SizedBox(width: 5),
                                  Text(
                                    dateText,
                                    style: const TextStyle(
                                        fontFamily: 'Pretendard',
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700,
                                        color: Color(0xFF9a9a9a)),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 25,
                              ),
                              Text(
                                mealText,
                                style: const TextStyle(
                                  fontFamily: 'Pretendard',
                                  fontSize: 18,
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                snapshot.data!.calories,
                                style: const TextStyle(
                                  fontFamily: 'Pretendard',
                                  fontSize: 14,
                                  color: Color(0xff9a9a9a),
                                ),
                              ),
                            ],
                          );
                        } else {
                          return const Center(
                            child: Text(
                              '...',
                              style: TextStyle(fontFamily: 'Pretendard'),
                            ),
                          );
                        }
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  CardWidget(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "$weekday요일 시간표",
                          style: const TextStyle(
                            fontFamily: "Pretendard",
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => TimetableScreen(
                                    grade: grade!, classname: classnumber!),
                                fullscreenDialog: true,
                              ),
                            );
                          },
                          child: const Text(
                            "바로가기 >",
                            style: TextStyle(
                              color: Color(0xFF5EA9FF),
                              fontFamily: "Pretendard",
                              fontSize: 14,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
									const WeatherWidget(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
