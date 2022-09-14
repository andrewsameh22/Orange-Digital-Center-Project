import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  // late Database database;

  // void createDatabase() {
  //   openDatabase(
  //     'odc.db',
  //     version: 1,
  //     onCreate: (database, version) async {
  //       print('Database Created');
  //       await database
  //           .execute(
  //           'CREATE TABLE tasks (id INTEGER PRIMARY KEY, title TEXT, date TEXT,time TEXT, status TEXT) ')
  //           .then((value) {
  //         print('Table Created');
  //       }).catchError((error) {
  //         print('Error when creating table${error.toString()}');
  //       });
  //     },
  //     onOpen: (database) {
  //       getDataFromDatabase(database);
  //
  //       print('database opened');
  //     },
  //   ).then((value) {
  //     database = value;
  //     emit(AppCreateDatabaseState());
  //   });
  // }
  //
  // insertToDatabase({
  //   required String title,
  //   required String time,
  //   required String date,
  // }) async {
  //   await database.transaction((txn) async {
  //     await txn
  //         .rawInsert(
  //         'INSERT INTO tasks(title,time,date,status) VALUES("$title","$time","$date","new")')
  //         .then((value) {
  //       print('$value inserted successfully');
  //       emit(AppInsertDatabaseState());
  //
  //       getDataFromDatabase(database);
  //     }).catchError((error) {
  //       print('Error when inserting New Record${error.toString()}');
  //     });
  //     return null;
  //   });
  // }
  //
  // void getDataFromDatabase(database) {
  //   newTasks = [];
  //   doneTasks = [];
  //   archivedTasks = [];
  //
  //   emit(AppGetDatabaseLoadingState());
  //   database.rawQuery('SELECT * FROM tasks').then((value) {
  //     value.forEach((element) {
  //       if (element['status'] == 'new') {
  //         newTasks.add(element);
  //       } else if (element['status'] == 'done') {
  //         doneTasks.add(element);
  //       } else
  //         archivedTasks.add(element);
  //     });
  //     emit(AppGetDatabaseState());
  //   });
  // }
  //
  // void updateData({
  //   required status,
  //   required int id,
  // }) async {
  //   database.rawUpdate(
  //     'UPDATE tasks SET status = ? WHERE id = ?',
  //     ['$status', id],
  //   ).then((value) {
  //     getDataFromDatabase(database);
  //     emit(AppUpdateDatabaseState());
  //   });
  // }
  //
  // void deleteData({
  //   required int id,
  // }) async {
  //   database.rawDelete(
  //     'DELETE FROM tasks WHERE id = ?',
  //     [id],
  //   ).then((value) {
  //     getDataFromDatabase(database);
  //     emit(AppDeleteDatabaseState());
  //   });
  // }

}
