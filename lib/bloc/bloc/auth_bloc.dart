import 'package:bloc/bloc.dart';
import 'package:login_ui/constants.dart';
import 'package:login_ui/modals/user_model.dart';
import 'package:login_ui/repository/auth_repo.dart';

import 'package:shared_preferences/shared_preferences.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  // final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final AuthRepository authRepository = AuthRepository();
  AuthBloc() : super(AuthInitial()) {
    on<AppStarted>(_mapAppStartedToState);
    on<RegisterUser>(_mapRegisterUserToState);
    on<SignedIn>(_mapSignedInToState);
  }
  void _mapAppStartedToState(AppStarted event, Emitter<AuthState> emmit) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool userLoggedIn = prefs.getBool(USER_LOGGED_IN) ?? false;

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
      bool isSucess = await authRepository.create(
          email: event.email, password: event.password);
      if (isSucess == true) {
        emmit(AuthRegistered());
      }
    } catch (e) {
      emmit(AuthUnauthenticated());
    }
  }

  void _mapSignedInToState(SignedIn event, Emitter<AuthState> emmit) async {
    emmit(AuthLoading());

    try {
      UserModel? user = await authRepository.get(email: event.email);

      if (user != null) {
        if (user.password == event.password) {
          SharedPreferences _prefss = await SharedPreferences.getInstance();
          _prefss.setBool(USER_LOGGED_IN, true);
          emmit(AuthAuthenticated());
        }
      } else {
        emmit(AuthUnauthenticated());
      }
    } catch (e) {
      emmit(AuthUnauthenticated());
    }
  }
}
