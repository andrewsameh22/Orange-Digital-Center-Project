import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../database/database/network/dio_helper.dart';
import '../../database/database/network/end_points.dart';
import '../../models/faq_model.dart';
import 'faq_state.dart';

class FaqCubit extends Cubit<FaqState> {
  FaqCubit() : super(FaqInitial());

  static FaqCubit get(context) => BlocProvider.of(context);

  FAQModel? faqModel;

  //use for get frequency of questions and answer from api
  Future<dynamic> getFAQ() async {
    emit(FaqLoading());
    DioHelper.getData(url: faqEndPoint).then((value) {
      faqModel = FAQModel.fromJson(json: value.data);
      emit(FaqSuccess());
    }).catchError((error) {
      emit(FaqError());
    });
  }
}
