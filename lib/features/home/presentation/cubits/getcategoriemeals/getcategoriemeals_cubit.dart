import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:resturant_app/core/utiles/services/dio/apiService.dart';
import 'package:resturant_app/features/home/data/getCuntryFoodModel.dart';

part 'getcategoriemeals_state.dart';

class GetcategoriemealsCubit extends Cubit<GetcategoriemealsState> {
  GetcategoriemealsCubit() : super(GetcategoriemealsInitial());
  getMeals({required String category}) async {
    emit(GetcategoriemealsLoading());
    final result = await Apiservice.preferences.getCategoryMeals(
      endPoint: 'filter.php?c=$category',
    );
    result.fold(
      (failure) {
        emit(GetcategoriemealsFailure(error: failure.message));
      },
      (success) {
        emit(GetcategoriemealsSuccess(meals: success));
      },
    );
  }
}
