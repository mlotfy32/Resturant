import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'passwordvisability_state.dart';

class PasswordvisabilityCubit extends Cubit<PasswordvisabilityState> {
  PasswordvisabilityCubit() : super(PasswordvisabilityInitial());
  bool isPasswordVisible = false;

  changeVisability() {
    bool newVis = !isPasswordVisible;
    emit(Passwordvisability(isPasswordVisible: newVis));
  }
}
