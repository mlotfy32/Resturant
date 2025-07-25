import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:resturant_app/core/utiles/shared_pref/prefs_Keys.dart';
import 'package:resturant_app/core/utiles/shared_pref/shared_pref.dart';

part 'checkbox_state.dart';

class CheckboxCubit extends Cubit<CheckboxState> {
  CheckboxCubit() : super(CheckboxInitial());
  changeBoxState({required bool isChecked}) async {
    await SharedPref.sharedPreferences.setBool(PrefsKeys.isLogin, isChecked);
    emit(CheckBox(isChecked: isChecked));
  }
}
