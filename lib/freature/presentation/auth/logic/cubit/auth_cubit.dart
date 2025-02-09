import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  void login(String email, String password) async {
    emit(AuthLoading());
    try {
      // ignore: unused_local_variable
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      emit(AuthSuccess());
    } on FirebaseException catch (e) {
      if (e.code == 'user-not-found') {
        emit(AuthFailure('No user found for that email.'));
      } else if (e.code == 'wrong-password') {
        emit(AuthFailure('Please enter correct password'));
      }
    } catch (e) {
      emit(
        AuthFailure(e.toString()),
      );
    }
  }

  void register(String email, String password) async {
    emit(AuthLoading());
    try {
      FirebaseAuth auth = FirebaseAuth.instance;
      // ignore: unused_local_variable
      UserCredential user = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      emit(AuthSuccess());
    } on FirebaseException catch (e) {
      if (e.code == 'email-already-in-use') {
        emit(AuthFailure('The account already exists for that email.'));
      } else if (e.code == 'weak-password') {
        emit(AuthFailure('Please enter strong password'));
      }
    } catch (e) {
      emit(
        AuthFailure(e.toString()),
      );
    }
  }
}
