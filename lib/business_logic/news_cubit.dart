import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import '../database/database/network/dio_helper.dart';
import '../database/database/network/end_points.dart';
import '../models/news_model.dart';
part 'news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit() : super(NewsInitial());

  static NewsCubit get(context) => BlocProvider.of(context);

  NewsModel? newsModel;

  //load news from api
  void getNews() {
    emit(NewsLoading());

    DioHelper.getData(url: newsEndPoint, token: 'token').then((value) {
      print(value.data);
      newsModel = NewsModel.fromJson(value.data);

      emit(NewsSuccess());
    }).catchError((onError) {
      print(onError);
      print("Cannot load news");
      emit(NewsError());
    });
  }
}
