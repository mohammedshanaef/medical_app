import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:medical_app/Features/auth/data/repositories/auth_repositories.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepository authRepository;

  AuthCubit(this.authRepository) : super(AuthInitial());


  Future<void> login(String email, String password) async {
    emit(AuthLoading());
    try {
      final user = await authRepository.loginWithEmailAndPassword(email, password);
      emit(AuthSuccess(user));
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }


  Future<void> signUp({
    required String name,
    required String phone,
    required String password,
  }) async {
    emit(AuthLoading());
    try {
      final userCredential = await authRepository.signUpWithEmailAndPassword(
        email: "$phone@gmail.com", 
        password: password,
      );

   
      await authRepository.updateUserProfile(
        userCredential.user!,
        name: name,
        phone: phone,
      );

      emit(AuthSuccess(userCredential.user));
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }


  Future<void> resetPassword(String email) async {
    emit(AuthLoading());
    try {
      await authRepository.resetPassword(email);
      emit(AuthResetSuccess());
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }
}
