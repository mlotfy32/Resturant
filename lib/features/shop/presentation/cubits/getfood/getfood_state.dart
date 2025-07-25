part of 'getfood_cubit.dart';

@immutable
abstract class GetfoodState {}

class GetfoodInitial extends GetfoodState {}

class GetfoodLoading extends GetfoodState {}

class GetfoodSuccess extends GetfoodState {
  final List<CuntryFood> food;

  GetfoodSuccess({required this.food});
}

class GetfoodFailure extends GetfoodState {
  final String error;

  GetfoodFailure({required this.error});
}
