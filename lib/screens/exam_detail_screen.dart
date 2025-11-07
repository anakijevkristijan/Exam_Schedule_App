import 'package:flutter/material.dart';
import '../models/exam.dart';
import 'package:intl/intl.dart';
class ExamDetailScreen extends StatelessWidget {
  final Exam exam;

  const ExamDetailScreen({Key? key, required this.exam}) : super(key: key);

  String _getTimeRemaining(DateTime examDate) {
    final Duration difference = examDate.difference(DateTime.now());

    if (difference.isNegative) {
      return "Испитот е веќе поминат.";
    }

    final int days = difference.inDays;
    final int hours = difference.inHours % 24;

    return "$days дена, $hours часа";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(exam.subjectName),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              exam.subjectName,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                const Icon(Icons.calendar_today),
                const SizedBox(width: 8),
                Text(
                  DateFormat('dd MMMM yyyy, HH:mm').format(exam.dateTime),
                  style: const TextStyle(fontSize: 18),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                const Icon(Icons.location_on),
                const SizedBox(width: 8),
                Text(
                  'Простории: ${exam.rooms.join(', ')}',
                  style: const TextStyle(fontSize: 18),
                ),
              ],
            ),
            const Divider(height: 40),
            Text(
              'Преостанува време:',
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5),
            Text(
              _getTimeRemaining(exam.dateTime),
              style: const TextStyle(fontSize: 20, color: Colors.blue),
            ),
          ],
        ),
      ),
    );
  }
}