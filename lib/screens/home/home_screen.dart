import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_ui/bloc/bloc/auth_bloc.dart';
import 'package:login_ui/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          const Text(
            "Sign In sucessfull",
            style: TextStyle(fontSize: 30),
          ),
          ElevatedButton(
              onPressed: () async {
                final prefs = await SharedPreferences.getInstance();
                prefs.setBool(USER_LOGGED_IN, false);
                context.read<AuthBloc>().add(AppStarted());
              },
              child: const Text('Sign out'))
        ],
      ),
    );
  }
}
