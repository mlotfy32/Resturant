import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:resturant_app/core/utiles/services/dio/apiService.dart';
import 'package:resturant_app/features/home/categorys/data/categoryModel.dart';

part 'categores_state.dart';

class CategoresCubit extends Cubit<CategoresState> {
  CategoresCubit() : super(CategoresInitial());
  Future<void> getCategories() async {
    emit(CategoresLoading());

    final result = await Apiservice.preferences.getCategories(
      endPoint: 'categories.php',
    );
    result.fold(
      (failure) {
        emit(CategoresFailure(error: failure.message));
      },
      (success) {
        emit(CategoresSuccess(categories: success));
      },
    );
  }
}
