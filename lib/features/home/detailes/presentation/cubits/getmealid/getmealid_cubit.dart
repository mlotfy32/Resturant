import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:resturant_app/core/utiles/services/dio/apiService.dart';
import 'package:resturant_app/features/home/detailes/data/mealDetailsModel.dart';

part 'getmealid_state.dart';

class GetmealidCubit extends Cubit<GetmealidState> {
  GetmealidCubit() : super(GetmealidInitial());
  getMealId({required String id}) async {
    emit(GetmealidLoading());
    final result = await Apiservice.preferences.getMealId(
      endPoint: 'lookup.php?i=$id',
    );
    result.fold(
      (failure) {
        emit(GetmealidFailure(error: failure.message));
      },
      (success) {
        emit(GetmealidSuccess(meal: success));
      },
    );
  }
}
