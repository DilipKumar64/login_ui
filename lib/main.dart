import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:login_ui/bloc/bloc/auth_bloc.dart';
import 'package:login_ui/firebase_options.dart';
import 'package:login_ui/screens/auth/auth_screen.dart';
import 'package:login_ui/screens/auth/register_screen.dart';
import 'package:login_ui/screens/auth/sign_in_screen.dart';
import 'package:login_ui/screens/home/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return BlocProvider(
            create: (context) => AuthBloc(),
            child: MaterialApp(
                debugShowCheckedModeBanner: false,
                title: 'Flutter Demo',
                theme: ThemeData(
                  primarySwatch: Colors.blue,
                ),
                // home: const SignInScreen(),
                home: MyHomePage()),
          );
        });
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final authenticationBloc = BlocProvider.of<AuthBloc>(context);

    // Dispatch the AppStarted event to check if the user is logged in.
    authenticationBloc.add(AppStarted());

    return Scaffold(
      body: Center(
        child: BlocBuilder<AuthBloc, AuthState>(
          // bloc: authenticationBloc,
          builder: (context, state) {
            if (state is AuthLoading) {
              return const CircularProgressIndicator();
            } else if (state is AuthAuthenticated) {
              // User is logged in, navigate to the HomePage.
              return const HomeScreen();
            } else if (state is RegisterButtonClickedState) {
              return const RegisterScreen();
            } else if (state is AuthRegistered) {
              return const SignInScreen();
            } else {
              // User is not logged in, navigate to the AuthScreen.
              return const AuthScreen();
            }
          },
        ),
      ),
    );
  }
}
