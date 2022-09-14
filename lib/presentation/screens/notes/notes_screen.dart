import 'package:flutter/material.dart';
import 'package:odc_flutter/presentation/screens/notes/add_note.dart';
import 'package:odc_flutter/presentation/styles/colours.dart';

import '../../../models/note_model.dart';

class NotesScreen extends StatefulWidget {
  @override
  State<NotesScreen> createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AddNote(),
              ));
        },
        child: Icon(Icons.add),
        backgroundColor: primaryColor,
      ),
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
      body: notesmodel.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.menu,
                    size: 100.0,
                    color: Colors.grey,
                  ),
                  Text(
                    'No Notes yet',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            )
          : Padding(
              padding: const EdgeInsets.all(20.0),
              child: ListView.separated(
                itemCount: notesmodel.length,
                separatorBuilder: (context, index) => SizedBox(
                  child: Divider(),
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
                itemBuilder: (context, index) => Material(
                  elevation: 2.0,
                  borderRadius: BorderRadius.circular(12),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Text(
                              notesmodel[index].title,
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.001,
                            ),
                            Text(
                              notesmodel[index].time,
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.001,
                            ),
                            Text(
                              notesmodel[index].date,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.edit,
                                color: primaryColor,
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  notesmodel.remove(index);
                                });
                              },
                              icon: Icon(
                                Icons.delete,
                                color: primaryColor,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
    );
  }
}
