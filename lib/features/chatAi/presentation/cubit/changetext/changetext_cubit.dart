import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'changetext_state.dart';

class ChangetextCubit extends Cubit<ChangetextState> {
  ChangetextCubit() : super(ChangetextInitial());
  changeText({required String text}) {
    emit(Changetext(text: text));
  }

  loading() {
    emit(ChangetextLoading());
  }
}
