import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:resturant_app/core/utiles/services/dio/apiService.dart';
import 'package:resturant_app/features/home/detailes/data/mealDetailsModel.dart'
    show Mealdetailsmodel;

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());
  searchByName({required String meal}) async {
    emit(SearchLoading());
    final result = await Apiservice.preferences.searchByName(
      endPoint: 'search.php?s=$meal',
    );
    result.fold(
      (failure) {
        emit(SearchFailure(error: failure.message));
      },
      (success) {
        emit(SearchSuccess(meals: success));
      },
    );
  }
}
