part of 'getmealid_cubit.dart';

@immutable
abstract class GetmealidState {}

class GetmealidInitial extends GetmealidState {}

class GetmealidLoading extends GetmealidState {}

class GetmealidSuccess extends GetmealidState {
  final Mealdetailsmodel meal;

  GetmealidSuccess({required this.meal});
}

class GetmealidFailure extends GetmealidState {
  final String error;

  GetmealidFailure({required this.error});
}
