import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:login_ui/constants.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  AuthBloc() : super(AuthInitial()) {
    on<AppStarted>(_mapAppStartedToState);
    on<RegisterUser>(_mapRegisterUserToState);
    on<SignedIn>(_mapSignedInToState);
    on<RegisterButtonClickedEvent>(onRegisterButtonClickedEvent);
  }
  void _mapAppStartedToState(AppStarted event, Emitter<AuthState> emmit) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    bool userLoggedIn = _prefs.getBool(USER_LOGGED_IN) ?? false;

    if (userLoggedIn == true) {
      emmit(AuthAuthenticated());
    } else {
      emmit(AuthUnauthenticated());
    }
  }

  void _mapRegisterUserToState(
      RegisterUser event, Emitter<AuthState> emmit) async {
    emmit(AuthLoading());
    try {
      await _firestore.collection('users').add({
        'email': event.email,
        'password': event.password,
      });
      emmit(AuthRegistered());
    } catch (e) {
      emmit(AuthUnauthenticated());
    }
  }

  void _mapSignedInToState(SignedIn event, Emitter<AuthState> emmit) async {
    emmit(AuthLoading());
    try {
      final QuerySnapshot result = await _firestore
          .collection('users')
          .where('email', isEqualTo: event.email)
          .where('password', isEqualTo: event.password)
          .get();

      if (result.docs.isNotEmpty) {
        emmit(AuthAuthenticated());
      } else {
        emmit(AuthUnauthenticated());
      }
    } catch (e) {
      emmit(AuthUnauthenticated());
    }
  }

  FutureOr<void> onRegisterButtonClickedEvent(
      RegisterButtonClickedEvent event, Emitter<AuthState> emit) {
    emit(RegisterButtonClickedState());
  }
}
