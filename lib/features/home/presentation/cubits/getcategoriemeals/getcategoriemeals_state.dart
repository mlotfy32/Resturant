part of 'getcategoriemeals_cubit.dart';

@immutable
abstract class GetcategoriemealsState {}

class GetcategoriemealsInitial extends GetcategoriemealsState {}

class GetcategoriemealsLoading extends GetcategoriemealsState {}

class GetcategoriemealsSuccess extends GetcategoriemealsState {
  final List<CuntryFood> meals;

  GetcategoriemealsSuccess({required this.meals});
}

class GetcategoriemealsFailure extends GetcategoriemealsState {
  final String error;

  GetcategoriemealsFailure({required this.error});
}
