import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:resturant_app/core/utiles/services/dio/apiService.dart';
import 'package:resturant_app/features/home/data/getCuntryFoodModel.dart';

part 'getfood_state.dart';

class GetfoodCubit extends Cubit<GetfoodState> {
  GetfoodCubit() : super(GetfoodInitial());

  getFood() async {
    emit(GetfoodLoading());
    final result = await Apiservice.preferences.getFood();
    result.fold(
      (failure) {
        emit(GetfoodFailure(error: failure.message));
      },
      (success) {
        emit(GetfoodSuccess(food: success));
      },
    );
  }
}
