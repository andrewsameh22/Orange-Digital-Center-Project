import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:odc_flutter/ResuableWidgets/default_button.dart';
import 'package:odc_flutter/models/note_model.dart';
import 'package:odc_flutter/presentation/styles/colours.dart';

import '../../../ResuableWidgets/TXTFld.dart';

class AddNote extends StatefulWidget {
  @override
  State<AddNote> createState() => _AddNoteState();
}

class _AddNoteState extends State<AddNote> {
  TextEditingController titleController = TextEditingController();

  TextEditingController timeController = TextEditingController();

  TextEditingController dateController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(
            'Notes',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          backgroundColor: Colors.white,
          centerTitle: true,
          elevation: 0.0,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.1,
                ),
                TxtFld(
                  onTap: () {},
                  controller: titleController,
                  keyType: TextInputType.text,
                  label: 'Task Title',
                  picon: Icon(
                    Icons.title,
                    color: primaryColor,
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Title Must Not Be Empty!';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                TxtFld(
                  readOnly: true,
                  controller: timeController,
                  keyType: TextInputType.datetime,
                  onTap: () {
                    showTimePicker(
                      context: context,
                      initialTime: TimeOfDay.now(),
                    ).then((value) {
                      timeController.text = value!.format(context);
                    });
                  },
                  label: 'Task Time',
                  picon: Icon(
                    Icons.watch_later_outlined,
                    color: primaryColor,
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Time Must Not Be Empty!';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                TxtFld(
                  controller: dateController,
                  keyType: TextInputType.datetime,
                  readOnly: true,
                  onTap: () {
                    showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime.now(),
                      lastDate: DateTime.parse('2050-01-01'),
                    ).then((value) {
                      dateController.text = DateFormat.yMMMd().format(value!);
                    });
                  },
                  label: 'Task Date',
                  picon: Icon(
                    Icons.date_range,
                    color: primaryColor,
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Date Must Not Be Empty!';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.2,
                ),
                defButton(
                  text: 'Submit',
                  onTap: () {
                    if (formKey.currentState!.validate()) {
                      print(titleController.text);
                      setState(() {
                        titleController.clear();
                        timeController.clear();
                        dateController.clear();
                        notesmodel.add(NotesModel(
                          title: titleController.text,
                          date: dateController.text,
                          time: timeController.text,
                        ));
                      });
                      print(notesmodel);
                      Navigator.pop(context);
                    }
                  },
                  color: primaryColor,
                  context: context,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
