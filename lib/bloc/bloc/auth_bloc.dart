import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  AuthBloc() : super(AuthInitial()) {
    on<AuthEvent>((event, emit) {
      on<AppStarted>(_mapAppStartedToState);
      on<RegisterUser>(_mapRegisteredToState);
      on<SignedIn>(_mapSignedInToState);
    });
  }
  void _mapAppStartedToState(AppStarted event, Emitter<AuthState> emmit) async {
    try {
      final User? currentUser = _firebaseAuth.currentUser;
      if (currentUser != null) {
        emmit(AuthAuthenticated());
      } else {
        emmit(AuthUnauthenticated());
      }
    } catch (e) {
      emmit(AuthUnauthenticated());
    }
  }

  void _mapRegisteredToState(
      RegisterUser event, Emitter<AuthState> emmit) async {
    emmit(AuthLoading());
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
        email: event.email,
        password: event.password,
      );
      emmit(AuthAuthenticated());
    } catch (e) {
      print('=================================');
      print(e);
      emmit(AuthUnauthenticated());
    }
  }

  void _mapSignedInToState(SignedIn event, Emitter<AuthState> emmit) async {
    emmit(AuthLoading());
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: event.email,
        password: event.password,
      );
      emmit(AuthUnauthenticated());
    } catch (e) {
      emmit(AuthUnauthenticated());
    }
  }
}
