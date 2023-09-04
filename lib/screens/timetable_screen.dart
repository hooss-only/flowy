import 'package:flowy/models/class_model.dart';
import 'package:flowy/services/api_services.dart';
import 'package:flowy/services/utilites.dart';
import 'package:flutter/material.dart';

class TimetableScreen extends StatefulWidget {
  const TimetableScreen({
    super.key,
    required this.grade,
    required this.classname,
  });

  final String grade;
  final String classname;

  @override
  State<TimetableScreen> createState() => _TimetableScreenState();
}

class _TimetableScreenState extends State<TimetableScreen> {
  late Future<List<ClassModel>> timetable;

  @override
  void initState() {
    super.initState();

    timetable = ApiService.getTodayClass(widget.grade, widget.classname);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('${widget.grade}-${widget.classname} 시간표'),
          centerTitle: true,
          backgroundColor: Colors.white,
        ),
        body: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          child: Center(
            child: FutureBuilder(
              future: timetable,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  String weekday = Utilites.getTodayWeekday('ko_KR');
                  double heightContainer =
                      235 + (76 * snapshot.data!.length.toDouble());

                  return Container(
                    width: 160,
                    height: heightContainer,
                    padding: const EdgeInsets.symmetric(
                      vertical: 45,
                      horizontal: 28,
                    ),
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
                    ),
                    child: Column(
                      children: [
                        Text(
                          weekday,
                          style: const TextStyle(
                            fontFamily: 'Pretendard',
                            fontWeight: FontWeight.w700,
                            fontSize: 24,
                          ),
                        ),
                        Container(
                          height: 23,
                          decoration: const BoxDecoration(
                            border: BorderDirectional(
                              bottom: BorderSide(
                                color: Color(0xFF707070),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 38,
                        ),
                        for (final ClassModel lesson in snapshot.data!)
                          Column(
                            children: [
                              Text(
                                lesson.lesson,
                                style: const TextStyle(
                                  fontFamily: 'Pretendard',
                                  fontWeight: FontWeight.w700,
                                  fontSize: 24,
                                ),
                              ),
                              Text(
                                lesson.teacher,
                                style: const TextStyle(
                                  fontFamily: 'Pretendard',
                                  fontSize: 20,
                                ),
                              ),
                              if (lesson.time + 1 != snapshot.data!.length)
                                const SizedBox(
                                  height: 23,
                                ),
                            ],
                          )
                      ],
                    ),
                  );
                }
                return const Column(
									children: [
										Text("로딩중..."),
										Text("로딩이 되지 않나요?"),
									],
								);
              },
            ),
          ),
        ));
  }
}
