class ClassModel {
  final int time;
  final String teacher, lesson;

  ClassModel.fromJson(Map<String, dynamic> json)
      : time = json['time'],
        teacher = json['teacher'],
        lesson = json['class'];
}
