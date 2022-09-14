import 'package:flutter/material.dart';

class NotesModel {
  String title;
  String time;
  String date;
  NotesModel({
    required this.title,
    required this.time,
    required this.date,
  });
}

List<NotesModel> notesmodel = [];
