import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../Models/ll_news_model/ll_news_model.dart';
import '../../Reposetries/all_news_repo.dart';

part 'all_news_cubit_state.dart';

class AllNewsCubitCubit extends Cubit<AllNewsCubitState> {
  AllNewsCubitCubit() : super(AllNewsCubitInitial());
  getAllNews() {
    emit(AllNewsCubitLoading());
    AllNewsApp().getAllnews().then((value) {
      if (value != null)
        emit(AllNewsCubiSuccess(ourresponse: value));
      else
        emit(AllNewsCubitError());
    });
  }
}
