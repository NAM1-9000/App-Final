import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:final22735/data/repositories/auth_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  final AuthRepository _authRepository = AuthRepository();

  // sign up
  void emailPasswordSignUp(
      String email, String password, String name, String number) async {
    emit(AuthLoading());
    try {
      final UserCredential userCredential = await _authRepository
          .emailPasswordSignUp(email, password, name, number);
      emit(AuthSuccess(userCredential));
    } catch (e) {
      emit(AuthFailed(e.toString()));
    }
  }

  // sign in
  void emailPasswordSignIn(String email, String password) async {
    emit(AuthLoading());
    try {
      final UserCredential userCredential =
          await _authRepository.emailPasswordSignIn(email, password);
      emit(AuthSuccess(userCredential));
    } catch (e) {
      emit(AuthFailed(e.toString()));
    }
  }

  // sign out
  void emailPasswordSignOut() async {
    emit(AuthLoading());
    try {
      await _authRepository.emailPasswordSignOut();
      emit(AuthInitial());
    } catch (e) {
      emit(AuthFailed(e.toString()));
    }
  }
}
