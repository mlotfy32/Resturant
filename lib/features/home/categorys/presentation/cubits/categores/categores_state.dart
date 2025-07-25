part of 'categores_cubit.dart';

@immutable
abstract class CategoresState {}

class CategoresInitial extends CategoresState {}

class CategoresLoading extends CategoresState {}

class CategoresSuccess extends CategoresState {
  final List<CategoryModel> categories;

  CategoresSuccess({required this.categories});
}

class CategoresFailure extends CategoresState {
  final String error;

  CategoresFailure({required this.error});
}
