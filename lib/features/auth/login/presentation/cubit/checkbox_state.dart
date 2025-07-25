part of 'checkbox_cubit.dart';

@immutable
abstract class CheckboxState {}

class CheckboxInitial extends CheckboxState {}

class CheckBox extends CheckboxState {
  final bool isChecked;

  CheckBox({required this.isChecked});
}
