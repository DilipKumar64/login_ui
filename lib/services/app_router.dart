import 'package:flutter/material.dart';
import 'package:login_ui/screens/auth/auth_screen.dart';
import 'package:login_ui/screens/auth/register_screen.dart';
import 'package:login_ui/screens/auth/sign_in_screen.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case AuthScreen.id:
        return MaterialPageRoute(builder: (_) => const AuthScreen());
      case RegisterScreen.id:
        return MaterialPageRoute(builder: (_) => const RegisterScreen());
      case SignInScreen.id:
        return MaterialPageRoute(builder: (_) => const SignInScreen());
      default:
        return null;
    }
  }
}
