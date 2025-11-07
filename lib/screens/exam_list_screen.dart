import 'package:flutter/material.dart';
import '../models/exam.dart';
import '../widgets/exam_card.dart';
import 'exam_detail_screen.dart';

class ExamListScreen extends StatefulWidget {
  const ExamListScreen({Key? key}) : super(key: key);

  @override
  _ExamListScreenState createState() => _ExamListScreenState();
}

class _ExamListScreenState extends State<ExamListScreen> {
  final List<Exam> exams = [
    Exam(
        subjectName: 'Мобилни информациски системи',
        dateTime: DateTime(2025, 3, 20, 9, 0),
        rooms: ['ФИНКИ-Амф', 'ФИНКИ-212']),
    Exam(
        subjectName: 'Веб Програмирање',
        dateTime: DateTime(2025, 8, 22, 10, 0),
        rooms: ['ФЕИТ-105']),
    Exam(
        subjectName: 'Бази на податоци',
        dateTime: DateTime(2025, 11, 15, 12, 0),
        rooms: ['ТМФ-Амф']),
    Exam(
        subjectName: 'Софтверско инженерство',
        dateTime: DateTime(2026, 1, 25, 14, 0),
        rooms: ['ФИНКИ-210']),
    Exam(
        subjectName: 'Структурно програмирање',
        dateTime: DateTime(2025, 9, 1, 9, 0),
        rooms: ['ФИНКИ-117', 'ФИНКИ-118']),
    Exam(
        subjectName: 'Алгоритми и податочни структури',
        dateTime: DateTime(2025, 12, 28, 11, 0),
        rooms: ['ФИНКИ-200']),
    Exam(
        subjectName: 'Компјутерски мрежи',
        dateTime: DateTime(2026, 10, 5, 13, 0),
        rooms: ['ФЕИТ-205']),
    Exam(
        subjectName: 'Оперативни системи',
        dateTime: DateTime(2025, 11, 29, 15, 0),
        rooms: ['ФИНКИ-300']),
    Exam(
        subjectName: 'Вовед во наука за податоци',
        dateTime: DateTime(2025, 2, 3, 10, 0),
        rooms: ['ФИНКИ-Лаб 1']),
    Exam(
        subjectName: 'Дискретна математика',
        dateTime: DateTime(2025, 1, 29, 8, 0),
        rooms: ['ФИНКИ-Амф']),
  ];

  late List<Exam> sortedExams;
  int totalExams = 0;

  @override
  void initState() {
    super.initState();
    exams.sort((a, b) => a.dateTime.compareTo(b.dateTime));
    sortedExams = exams;
    totalExams = exams.length;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Распоред за испити - 203247'),
        backgroundColor: Colors.blue,
      ),
      body: ListView.builder(
        itemCount: sortedExams.length,
        itemBuilder: (context, index) {
          final exam = sortedExams[index];
          return ExamCard(
            exam: exam,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ExamDetailScreen(exam: exam),
                ),
              );
            },
          );
        },
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Chip(
                label: Text(
                  'Вкупно испити: $totalExams',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                backgroundColor: Colors.blue.shade100,
              ),
            ],
          ),
        ),
      ),
    );
  }
}