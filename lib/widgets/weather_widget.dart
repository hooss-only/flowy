import 'package:flowy/models/weather_model.dart';
import 'package:flowy/services/api_services.dart';
import 'package:flutter/material.dart';

class WeatherWidget extends StatefulWidget {
  const WeatherWidget({super.key});

  @override
  State<WeatherWidget> createState() => _WeatherWidgetState();
}

class _WeatherWidgetState extends State<WeatherWidget> {
  late Future<WeatherModel> weather;

  @override
  void initState() {
    super.initState();
    weather = ApiService.getWeather();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: weather,
      builder: (context, snapshot) {
        Map<String, dynamic> weatherGradientSet = {
          'Clear': const [Color(0xFFD8BFFF), Color(0xFFA2E2FF)],
          'Clouds': const [Color(0xFF959595), Color(0xFF6D6D6D)],
					'Rain': const [Color(0xFF959595), Color(0xFF414D65)],
					'Snow': const [Color(0xFF4DEDFF), Color(0xFFC2ECFF)]
        };

				Map<String, IconData> weatherIconSet = {
					'Clear': Icons.wb_sunny_rounded,
					'Clouds': Icons.cloud_rounded,
					'Rain': Icons.water_drop_rounded,
					'Snow': Icons.ac_unit_rounded,
					'Thunderstorm': Icons.thunderstorm_rounded,
					'Drizzle': Icons.water_drop_rounded,
					'Tornado': Icons.tornado_rounded,
				};

        if (snapshot.hasData) {
          Gradient gradient = LinearGradient(
            colors: weatherGradientSet[snapshot.data!.main],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          );


          return Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 33),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 6,
                  offset: const Offset(0, 3),
                ),
              ],
              borderRadius: BorderRadius.circular(25),
              gradient: gradient,
            ),
            child: Row(
              children: [
                Icon(
                  weatherIconSet[snapshot.data!.main],
                  size: 85,
                  color: Colors.white,
                ),
                const SizedBox(
                  width: 25,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${snapshot.data!.temp.toInt()}℃",
                      style: const TextStyle(
                        fontFamily: 'Pretendard',
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      snapshot.data!.description,
                      style: const TextStyle(
                        fontFamily: 'Pretendard',
                        fontSize: 24,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      '체감 ${snapshot.data!.feels_like}℃ 습도 ${snapshot.data!.humidity}%',
                      style: const TextStyle(
                        fontFamily: 'Pretendard',
                        fontSize: 14,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ],
            ),
          );
        }
        return Text("Loading...");
      },
    );
  }
}
