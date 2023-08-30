import 'dart:convert';

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

  static Future
}
