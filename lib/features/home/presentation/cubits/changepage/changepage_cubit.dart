import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'changepage_state.dart';

class ChangepageCubit extends Cubit<ChangepageState> {
  ChangepageCubit() : super(ChangepageInitial());
  int initialPage = 1;
  changePage({required int newPage}) {
    initialPage = newPage;
    emit(Changepage());
  }
}
