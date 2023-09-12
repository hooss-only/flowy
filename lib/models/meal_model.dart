class MealModel {
  final String date, meals, calories;

  MealModel.fromJson(Map<String, dynamic> json)
      : date = json['MLSV_YMD'],
        meals = json['DDISH_NM'],
        calories = json['CAL_INFO'];
}
