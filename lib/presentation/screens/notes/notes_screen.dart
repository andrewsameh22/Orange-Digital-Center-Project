import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odc_flutter/presentation/screens/notes/add_note.dart';
import 'package:odc_flutter/presentation/styles/colours.dart';

import '../../../ResuableWidgets/custom_text.dart';
import '../../../business_logic/notes_cubit.dart';
import '../../../business_logic/notes_state.dart';
import '../../../database/database/local/sql_helperl.dart';
import '../../../models/note_model.dart';
import '../../styles/constants.dart';
import 'details_of_note.dart';

class NotesScreen extends StatefulWidget {
  @override
  State<NotesScreen> createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NotesCubit, NotesState>(
      listener: (context, state) {
        if (state is DatabaseCreate) {
          // notesCubit.initialize();

        }
      },
      builder: (context, state) {
        NotesCubit notesCubit = NotesCubit.get(context);
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
            centerTitle: true,
            title: Text(
              'Notes',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),
            backgroundColor: Colors.white,
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
            padding: const EdgeInsets.all(12),
            child: FutureBuilder(
              future: HelperSql.getAllRowsDB(),
              builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                if (snapshot.hasData) {
                  if (snapshot.data.length == 0) {
                    return Center(
                        child: CustomText(
                      text: "There's No Data To Show",
                      fontSize: titleFont,
                      weight: FontWeight.w500,
                      textColor: Colors.black,
                    ));
                  } else {
                    return ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Card(
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),

                          //list of notes
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ListTile(
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(
                                    builder: (BuildContext context) {
                                  return Padding(
                                    padding: const EdgeInsets.all(1.0),
                                    child: DetailsOfNoteScreen(
                                      title: snapshot.data[index].title,
                                      date: snapshot.data[index].date,
                                      description:
                                          snapshot.data[index].description,
                                    ),
                                  );
                                }));
                              },
                              title: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: CustomText(
                                  text: "${snapshot.data[index].title}",
                                  fontSize: 22,
                                  weight: FontWeight.bold,
                                  textColor: black,
                                ),
                              ),
                              subtitle: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: CustomText(
                                  text: "${snapshot.data[index].date}",
                                  fontSize: titleFont,
                                  weight: FontWeight.w400,
                                  textColor: black,
                                ),
                              ),
                              trailing: Wrap(
                                children: [
                                  //btn edit
                                  IconButton(
                                    onPressed: () {
                                      notesCubit.getOneData(
                                          context,
                                          snapshot.data[index].id,
                                          snapshot.data[index].title,
                                          snapshot.data[index].description,
                                          snapshot.data[index].date);
                                    },
                                    icon: const Icon(Icons.edit),
                                    iconSize: deleteSize,
                                    color: primaryColor,
                                  ),

                                  //btn delete
                                  IconButton(
                                    onPressed: () {
                                      notesCubit
                                          .delete(snapshot.data[index].id);
                                    },
                                    icon: const Icon(Icons.delete),
                                    iconSize: deleteSize,
                                    color: primaryColor,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  }
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              },
            ),
          ),
          // : Padding(
          //     padding: const EdgeInsets.all(20.0),
          //     child: ListView.separated(
          //       itemCount: notesmodel.length,
          //       separatorBuilder: (context, index) => SizedBox(
          //         child: Divider(),
          //         height: MediaQuery.of(context).size.height * 0.05,
          //       ),
          //       itemBuilder: (context, index) => Material(
          //         elevation: 2.0,
          //         borderRadius: BorderRadius.circular(12),
          //         child: Padding(
          //           padding: const EdgeInsets.all(8.0),
          //           child: Row(
          //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //             children: [
          //               Column(
          //                 children: [
          //                   Text(
          //                     notesmodel[index].title,
          //                     style: TextStyle(
          //                       fontSize: 22,
          //                       fontWeight: FontWeight.bold,
          //                       color: Colors.black,
          //                     ),
          //                   ),
          //                   SizedBox(
          //                     height: MediaQuery.of(context).size.height *
          //                         0.001,
          //                   ),
          //                   Text(
          //                     'notesmodel[index].time',
          //                     style: TextStyle(
          //                       fontSize: 20,
          //                       color: Colors.black,
          //                     ),
          //                   ),
          //                   SizedBox(
          //                     height: MediaQuery.of(context).size.height *
          //                         0.001,
          //                   ),
          //                   Text(
          //                     notesmodel[index].date,
          //                     style: TextStyle(
          //                       color: Colors.black,
          //                       fontSize: 20,
          //                     ),
          //                   ),
          //                 ],
          //               ),
          //               Row(
          //                 children: [
          //                   IconButton(
          //                     onPressed: () {},
          //                     icon: Icon(
          //                       Icons.edit,
          //                       color: primaryColor,
          //                     ),
          //                   ),
          //                   IconButton(
          //                     onPressed: () {
          //                       setState(() {
          //                         notesmodel.remove(index);
          //                       });
          //                     },
          //                     icon: Icon(
          //                       Icons.delete,
          //                       color: primaryColor,
          //                     ),
          //                   ),
          //                 ],
          //               )
          //             ],
          //           ),
          //         ),
          //       ),
          //     ),
          //   ),
        );
      },
    );
  }
}
