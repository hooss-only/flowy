import 'package:flutter/material.dart';

class TimetableScreen extends StatelessWidget {
  const TimetableScreen({
    super.key,
    required this.grade,
    required this.classname,
  });

  final String grade;
  final String classname;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$grade-$classname 시간표'),
        centerTitle: true,
      ),
    );
  }
}
