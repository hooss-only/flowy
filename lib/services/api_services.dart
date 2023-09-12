import 'dart:convert';

import 'package:flowy/models/class_model.dart';
import 'package:flowy/models/weather_model.dart';
import 'package:flowy/services/utilites.dart';
import 'package:http/http.dart' as http;
import 'package:flowy/models/meal_model.dart';
import 'package:flowy/services/keys.dart';

class ApiService {
  static const String baseURL = 'https://open.neis.go.kr/hub/';
  static const String key = Keys.neisKey;

  // code of Office of Education of Daegu.
  static const String officeCode = "D10";

  // school code of KNUHS.
  static const String schoolCode = "7004180";

  static Future<MealModel> getTodayMeal() async {
    final today = Utilites.getToday();
    final url = Uri.parse(
        '${baseURL}mealServiceDietInfo/?KEY=$key&Type=json&ATPT_OFCDC_SC_CODE=$officeCode&SD_SCHUL_CODE=$schoolCode&MLSV_YMD=$today');

    final response = await http.get(url);
    if (response.statusCode == 200) {
      final meal =
          jsonDecode(response.body)['mealServiceDietInfo'][1]['row'][0];
      return MealModel.fromJson(meal);
    } else {
      throw Error();
    }
  }

  static Future<List<ClassModel>> getTodayClass(
      String grade, String classname) async {
    final weekday = Utilites.getTodayWeekday('en_US').toLowerCase();

    final url = Uri.parse(
        'https://raw.githubusercontent.com/hooss-only/flowy-data/master/$grade-$classname.json');

    final response = await http.get(url);

    if (response.statusCode == 200) {
      List<ClassModel> timetable = [];

      final timetableJson = jsonDecode(response.body)[weekday];

      for (final lesson in timetableJson) {
        timetable.add(ClassModel.fromJson(lesson));
      }

      return timetable;
    } else {
      throw Error();
    }
  }

  static Future<WeatherModel> getWeather() async {
    const language = 'kr';
    const units = 'metric';
    const city = 'daegu';

    final url = Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?q=$city&appid=${Keys.weatherKey}&lang=$language&units=$units');

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final weather = jsonDecode(response.body);

      return WeatherModel.fromJson(weather);
    } else {
      throw Error();
    }
  }
}
