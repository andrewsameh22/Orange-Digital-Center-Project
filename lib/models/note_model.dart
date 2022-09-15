import 'package:flutter/material.dart';

// class NotesModel {
//   String title;
//   String time;
//   String date;
//   NotesModel({
//     required this.title,
//     required this.time,
//     required this.date,
//   });
// }

List<NotesModel> notesmodel = [];

class NotesModel {
  var id;
  var description;
  var title;
  var date;

  NotesModel({
    required this.id,
    required this.description,
    required this.title,
    required this.date,
  });
}
