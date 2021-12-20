import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({Key? key}) : super(key: key);

  @override
  _CalendarPageState createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Takvim",
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
        ),
        body: Text("sa"));
  }

  List<Event> _getDataSource() {
    final List<Event> events = <Event>[];

    final DateTime today = DateTime.now();
    final DateTime startTime =
        DateTime(today.year, today.month, today.day, 9, 0, 0);
    final DateTime endTime = startTime.add(const Duration(hours: 2));

    events.add(Note(
        "sa", "as", "note", DateTime.now(), DateTime.now(), Color(0xFF0F8644)));

    events.add(Note(
        "sa", "as", "note", DateTime.now(), DateTime.now(), Color(0xFF0F8644)));

    events.add(Note(
        "sa", "as", "note", DateTime.now(), DateTime.now(), Color(0xFF0F8644)));

    events.add(Note(
        "sa", "as", "note", DateTime.now(), DateTime.now(), Color(0xFF0F8644)));

    events.add(Note(
        "sa", "as", "note", DateTime.now(), DateTime.now(), Color(0xFF0F8644)));

    events.add(Note(
        "sa", "as", "note", DateTime.now(), DateTime.now(), Color(0xFF0F8644)));

    return events;
  }
}

class Calendar extends CalendarDataSource {
  Calendar(List<Event> source) {
    appointments = source;
  }

  @override
  DateTime getStartTime(int index) {
    return _getMeetingData(index).from;
  }

  @override
  DateTime getEndTime(int index) {
    return _getMeetingData(index).to;
  }

  @override
  String getSubject(int index) {
    return _getMeetingData(index).title;
  }

  @override
  Color getColor(int index) {
    return _getMeetingData(index).background;
  }

  Event _getMeetingData(int index) {
    final dynamic meeting = appointments![index];
    late final Event meetingData;
    if (meeting is Event) {
      meetingData = meeting;
    }

    return meetingData;
  }
}

class Event {
  Event(this.title, this.from, this.to, this.background, this.type);

  String title;

  String type;

  DateTime from;

  DateTime to;

  Color background;
}

class Note extends Event {
  String content;
  Note(this.content, String title, String type, DateTime from, DateTime to,
      Color background)
      : super(title, from, to, background, type);
}
