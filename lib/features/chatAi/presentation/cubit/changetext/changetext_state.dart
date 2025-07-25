part of 'changetext_cubit.dart';

@immutable
abstract class ChangetextState {}

class ChangetextInitial extends ChangetextState {}

class ChangetextLoading extends ChangetextState {}

class Changetext extends ChangetextState {
  final String text;

  Changetext({required this.text});
}
