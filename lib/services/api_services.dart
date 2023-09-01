import 'dart:convert';

import 'package:flowy/models/class_model.dart';
import 'package:flowy/services/utilites.dart';
import 'package:http/http.dart' as http;
import 'package:flowy/models/meal_model.dart';
import 'package:flowy/services/keys.dart';

class ApiService {
  static const String baseURL = 'https://open.neis.go.kr/hub/';
  static const String key = Keys.neisKey;

  static Future<MealModel> getTodayMeal() async {
    final today = Utilites.getToday();
    final url = Uri.parse(
        '${baseURL}mealServiceDietInfo/?KEY=$key&Type=json&ATPT_OFCDC_SC_CODE=D10&SD_SCHUL_CODE=7004180&MLSV_YMD=$today');

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
}
