import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'loginb_state.dart';

class LoginbCubit extends Cubit<LoginbState> {
  LoginbCubit() : super(LoginbInitial());

  login({required String pass, required String email}) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: pass,
      );
      emit(LoginSuccess());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        emit(LoginFailure(error: 'No user found for that email.'));
      } else if (e.code == 'wrong-password') {
        emit(LoginFailure(error: 'Wrong password provided for that user.'));
      }
    } catch (e) {
      print(e);
    }
  }
}
