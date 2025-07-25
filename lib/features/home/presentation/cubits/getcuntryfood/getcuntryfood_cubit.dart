import 'package:bloc/bloc.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:meta/meta.dart';
import 'package:resturant_app/core/utiles/services/dio/apiService.dart';
import 'package:resturant_app/features/home/data/getCuntryFoodModel.dart'
    show CuntryFood;

part 'getcuntryfood_state.dart';

class GetcuntryfoodCubit extends Cubit<GetcuntryfoodState> {
  GetcuntryfoodCubit() : super(GetcuntryfoodInitial());

  getCuntryFood() async {
    emit(GetcuntryfoodLoading());
    final result = await Apiservice.preferences.getCuntryFood(
      endPoint: 'filter.php?a=Egyptian',
    );
    result.fold(
      (failure) {
        emit(GetcuntryfoodFailure(error: failure.message));
      },
      (success) {
        emit(GetcuntryfoodSuccess(food: success));
      },
    );
  }
}
