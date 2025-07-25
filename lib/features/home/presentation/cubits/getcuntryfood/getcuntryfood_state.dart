part of 'getcuntryfood_cubit.dart';

@immutable
abstract class GetcuntryfoodState {}

class GetcuntryfoodInitial extends GetcuntryfoodState {}

class GetcuntryfoodLoading extends GetcuntryfoodState {}

class GetcuntryfoodSuccess extends GetcuntryfoodState {
  final List<CuntryFood> food;

  GetcuntryfoodSuccess({required this.food});
}

class GetcuntryfoodFailure extends GetcuntryfoodState {
  final String error;

  GetcuntryfoodFailure({required this.error});
}
